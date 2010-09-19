require 'rails-settings/railtie'

load File.join(File.dirname(__FILE__), "rails-settings", "initializer.rb")
adapter_path = File.join( File.dirname(__FILE__), "rails-settings", "adapters")

RS = RailsSettings
RS.register_adapter :datamapper, "#{adapter_path}/datamapper" if defined?(DataMapper)
module RailsSettings
  require 'yaml'
  require 'rails-settings/scoped'
  def self.run
    RS.load_adapter! :datamapper
  end
end
