class ApplicationConfiguration < ActiveSupport::OrderedOptions

 def load
  common_file = "#{Rails.root}/config/app_config/common.rb"
  if File.exists?(common_file)
   eval(File.read(common_file))
  end
  env_file = "#{Rails.root}/config/app_config/#{Rails.env}.rb"
  if File.exists?(env_file)
   eval(File.read(env_file))
  end
 end

 def reload!
  self.clear
  self.load
 end

end

::AppConfig = ApplicationConfiguration.new
AppConfig.load
