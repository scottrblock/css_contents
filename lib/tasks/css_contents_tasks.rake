desc "Make CSS Coments"
namespace :css_contents do
  task :commentify => :environment do
    require "fileutils"
    require "tempfile"
    
    puts 'Begining your commentifying'
    
    all_stylesheets = Dir.glob("**/app/assets/**/*.scss")
    files_to_do = []
    
    puts 'Finding which stylesheets to commentify'
    all_stylesheets.each do |f|
      file = File.new(f, 'r+')
      i = 1;
      while(line = file.gets)
        #puts line
        if line.include? 'commentify'
          files_to_do << f
        end
        i = i + 1
      end
    end
        
    if files_to_do.length == 0
      puts 'No stylesheets found to commentify'
    else
      puts 'Beggining commentification:'
      files_to_do.each do |f|
        
        puts "Commentifying #{f}"
        
        begin
          file = File.new(f, 'r')
          enhancedTemp = Tempfile.new('onetemp')
          chapter_string = ''
          i = 1;
          while(line = file.gets)
            if line.include? 'chapter'
              clean_line = line
              clean_line.slice! "//chapter"
              clean_line = "Chapter #{i}" + ": " + clean_line
              clean_line = "    " + clean_line
              
              enhancedTemp.write("//" + clean_line)
              chapter_string += clean_line
                
              i = i + 1
            else
              enhancedTemp.write(line)
            end
          end      
        
          enhancedTemp.rewind

          temp = Tempfile.new('temp')
          while(line = enhancedTemp.gets)
            if line.include? 'commentify'
              temp.write("/* Auto Generated Table of Contents:\n")
              temp.write(chapter_string)
              temp.write("*/")
            else
              temp.write(line)
            end
          end
          
          temp.rewind
          wFile = File.new(f, 'w+')
          
          wFile.write(temp.read)              
        ensure
          enhancedTemp.close
          enhancedTemp.unlink
          
          temp.close
          temp.unlink
        end
        
      end
    end
    
  end
end