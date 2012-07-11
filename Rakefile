require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('css_contents', '0.0.1') do |p|
  p.description    = "This gem is for automatically creating a table of contents at the top of a given scss file."
  p.url            = "http://github.com/scottrblock/css-contents"
  p.author         = "Scott Block"
  p.email          = "scottrblock@gmaill.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }