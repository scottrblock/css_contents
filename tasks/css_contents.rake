#this is the part I need to write!

namespace :css_contents do
  task :commentify => :envioronment do
    require "fileutils"
    all_stylesheets = Dir.glob("**/apps/assets/**/*.css") + Dir.glob("**/apps/assets/**/*.scss")
    
    all_stylesheets.each do |f|
      file = File.new(f, 'r+')
      while(line = file.gets)
        puts line
      end
    end
    
  end
end