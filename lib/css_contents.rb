Dir["tasks/**/*.rake"].each { |ext| load ext } if defined?(Rake)

module CssContents
    def self.included(base)
      base.extend ClassMethods
    end  

    module ClassMethods    
    end
  end

  class ActiveRecord::Base
    include CssContents
end
