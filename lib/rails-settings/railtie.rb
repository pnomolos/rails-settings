module RailsSettings
  class Railtie << Rails::Railtie
    railtie_name :rails_settings
    
    initializer "rails_settings.init_rails" do |app|
      RailsSetttings.run
    end
  end
end
      