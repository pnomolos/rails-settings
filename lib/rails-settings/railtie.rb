module RailsSettings
  class Railtie << Rails::Railtie
    railtie_name :rails_settings
    
    initializer "rails_settings.setup_settings" do |app|
      
    end
  end
end
      