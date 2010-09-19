if defined?(Merb::Plugins)

  require "yaml"

  $:.unshift File.dirname(__FILE__)

  load File.join(File.dirname(__FILE__), "merb-settings", "initializer.rb")

  load_dependency 'merb-slices', nil
  Merb::Plugins.add_rakefiles "merb-settings/merbtasks", "merb-settings/slicetasks"

  # Register the Slice for the current host application
  Merb::Slices::register(__FILE__)
  
  # Slice configuration - set this in a before_app_loads callback.
  #Merb::Slices::config[:merb_settings][:foo] ||= :bar

  adapter_path = File.join( File.dirname(__FILE__), "merb-settings", "adapters")

  MS = MerbSettings
  MS.register_adapter :datamapper, "#{adapter_path}/datamapper"
  #MS.register_adapter :activerecord, "#{adapter_path}/activerecord"
  
  # All Slice code is expected to be namespaced inside a module
  module MerbSettings
    
    # Slice metadata
    self.description = "MerbSettings"
    self.version = "0.0.1"
    self.author = "Felix McCoey"
    
    # Stub classes loaded hook - runs before LoadClasses BootLoader
    # right after a slice's classes have been loaded internally.
    def self.loaded
      MS.load_adapter!
    end
    
    # Initialization hook - runs before AfterAppLoads BootLoader
    def self.init
    end
    
    # Activation hook - runs after AfterAppLoads BootLoader
    def self.activate
    end
    
    # Deactivation hook - triggered by Merb::Slices.deactivate(MerbSettings)
    def self.deactivate
    end
    
    #MerbSettings.setup_default_structure!

    # Setup routes inside the host application
    #
    # @param scope<Merb::Router::Behaviour>
    #  Routes will be added within this scope (namespace). In fact, any 
    #  router behaviour is a valid namespace, so you can attach
    #  routes at any level of your router setup.
    #
    # @note prefix your named routes with :merb_settings_
    #   to avoid potential conflicts with global named routes.
    def self.setup_router(scope)
    end
    
  end
  
  # Add dependencies for other MerbSettings classes below. Example:
  require "merb-settings/scoped"
  
end
