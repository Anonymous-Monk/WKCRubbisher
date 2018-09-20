#!/usr/bin/ruby
# -*- coding:utf-8 -*-


#-------------------------------------------
#   脚本功能:更改文件名及内容前缀
#   参数: $file_full_path 工程主路径
#   参数: $group_main 需要操作的主文件夹
#   参数: $file_header_old 需要替换的前缀
#   参数: $file_header_new 替换后的前缀
#   参数: $is_rename_inside 是否替换属性或方法前缀
#-------------------------------------------

require 'find'
require 'xcodeproj'



$file_full_path = "/Users/weikunchao/Desktop/ffff"
$group_main = "ffff"
$file_header_old = "SQZ"
$file_header_new = "SHM"
$is_rename_inside = true



#-------------------------------------
#        设置不操作类型
#-------------------------------------
def ingore_type(path)

      if path.length == 0 
        return true
      end

      if path.include?("DS_Store")
        return true
      end

      if path.include?(".xcworkspace")
        return true
      end

      if path.include?("Pods")
        return true
      end

      if path.include?("Podfile")
        return true
      end

      if path.include?(".git")
        return true
      end

      if path.include?(".xcassets")
        return true
      end

      if path.include?(".framework")
        return true
      end

      if path.include?(".lproj")
        return true
      end

      if path.include?(".plist")
        return true
      end

      if path.include?(".json")
        return true
      end

      if path.include?(".zip")
        return true
      end

      if path.include?(".storyboard")
        return true
      end

      if path.include?("README.md")
        return true
      end

      if path.include?(".png")
        return true
      end

      if path.include?(".jpg")
        return true
      end

      if path.include?(".data")
        return true
      end

      if path.include?(".bin")
        return true
      end

      if path.include?(".mp4")
        return true
      end

      if path.include?(".mko")
        return true
      end

      if path.include?(".mko")
        return true
      end

      if path.include?(".ttf")
        return true
      end

      if path.include?(".mov")
        return true
      end

  return false

end


#----------------------------------------
# 
# 蓝色文件夹同样被视为引用文件,特殊对待
#
#----------------------------------------
def ingore_blueDir_type(path)
	 if !File.directory?(path)
  	return true
   end

   if path.include?("guess_words")
   	return true
   end

   if path.include?("PrepData")
   	return true
   end

   if path.include?("resource")
   	return true
   end
  return false 
end


#-----------------------------------------
#            遍历所有文件
#-----------------------------------------

puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>开始更改本地文件"

Find.find($file_full_path) do |path|

    is_ingore = ingore_type path
    if is_ingore
      next()
    end
 
    if File.directory?(path)  # 去掉文件夹
    	next()
    end
    #-----------------------------------替换文件内容
    file_comments = File.read(path)
    file_comments.gsub!($file_header_old,$file_header_new) # 替换所有大写字母
    if $is_rename_inside
        file_comments.gsub!($file_header_old.downcase() + "_",$file_header_new.downcase() + "_") # 替换内部方法或属性前缀
    end
    aFile = File.new(path, "r+")
    aFile.puts(file_comments)
    aFile.close()
    
    #-----------------------------------更改本地文件
    if path.include?($file_header_old)
    	file_path_new = path.sub($file_header_old,$file_header_new)
    	File::rename(path,file_path_new)
    end
    
end


#-------------------------------------------
#           更改文件引用
#-------------------------------------------

$project_path = "#{$file_full_path + "/" + $group_main + ".xcodeproj"}" # 拼接xcodeproj
$project = Xcodeproj::Project.open($project_path) # 打开工程
$target = $project.targets.first # 目标target

def traverse_group(group)

   group_find = $project.main_group.find_subpath(group,true)

   file_path = group_find.real_path.to_s
   ingore_blue = ingore_blueDir_type file_path # 剔除非文件夹及蓝色文件夹
   if ingore_blue
	    return 
   end

   group_find.set_source_tree('<group>')
   childrens = group_find.children
   childrens.each do |children|
   path_str = children.path.to_s

    if !path_str.include?('.') && path_str.length > 0 #仍然是文件夹
       new_path = "#{group + "/" + path_str}"

       traverse_group(new_path)
    else
      is_next = ingore_type path_str
      if is_next
        next()
      end
      path_str.sub!($file_header_old,$file_header_new) # 转换引用

    end
      
  end
     
end

puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>开始更改文件引用"
traverse_group $group_main

puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>更改保存完毕"
$project.save() # 保存更改
