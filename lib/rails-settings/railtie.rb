require 'rails'
require 'rails-settings'

module RailsSettings
  class Railtie < Rails::Railtie
    initializer "rails_settings.init_rails" do |app|
      RailsSetttings::run
    end
  end
end
      