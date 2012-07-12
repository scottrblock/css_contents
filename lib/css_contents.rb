Dir["tasks/**/*.rake"].each { |ext| load ext } if defined?(Rake)

module CssContents < Rails::Railtie
    rake_tasks do
      Dir[File.join(File.dirname(__FILE__),'tasks/*.rake')].each { |f| load f }
    end
    
    def self.included(base)
      base.extend ClassMethods
    end  

    module ClassMethods    
    end
  end

  class ActiveRecord::Base
    include CssContents
end
