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
        #puts "Commentifying #{f}"
        file = File.new(f, 'r+')
        chapter_string = ''
        
        while(line = file.gets)  
          if line.include? 'chapter'
            chapter_string += line
          end
        end
        
        begin
          beginingTemp = Tempfile.new('temp')
          file.rewind
          while(line = file.gets)
            if line.include? 'commentify'
              beginingTemp.write(chapter_string)
            else
              beginingTemp.write(line)
            end
          end
          
          beginingTemp.rewind
          wFile = File.new(f, 'w+')
          
          wFile.write(beginingTemp.read)
                    
        ensure
          #close and unlink temp file
        end
        
      end
    end
    
  end
end