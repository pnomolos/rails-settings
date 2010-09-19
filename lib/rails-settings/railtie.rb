require 'rails'
require 'rails-settings'

module RailsSettings
  class Railtie < Rails::Railtie
    initializer "rails_settings.init_rails" do |app|
      RailsSettings::run
    end
  end
end
      