require 'rails-settings/railtie'

load File.join(File.dirname(__FILE__), "rails-settings", "initializer.rb")

RS = RailsSettings
RS.register_adapter :datamapper, "#{adapter_path}/datamapper" if defined?(DataMapper)
module RailsSettings
  require 'yaml'
  def run
    RS.load_adapter!
  end

  require 'rails-settings/scoped'  
end
