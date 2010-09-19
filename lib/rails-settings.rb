require 'rails-settings/railtie'

load File.join(File.dirname(__FILE__), "rails-settings", "initializer.rb")
adapter_path = File.join( File.dirname(__FILE__), "rails-settings", "adapters")

RS = RailsSettings
RS.register_adapter :datamapper, "#{adapter_path}/datamapper" if defined?(DataMapper)
module RailsSettings
  require 'yaml'
  require 'rails-settings/scoped'
  
  # @param <Symbol> The configuration key.
  # @return <Object> The configuration value.
  def [](key)
    self.config[key]
  end

  # @param <Symbol> The configuration key.
  # @param <Object> The configuration value.
  def []=(key, value)
    self.config[key] = value
  end
  
  def self.run
    RS.load_adapter! :datamapper
  end
end
