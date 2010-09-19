require 'dm-validations'
require 'dm-timestamps'

path = File.dirname(__FILE__)

if Rails.env == 'test'
  # Need to make sure the class is removed when testing
  # It should not impact a normal apps tests
  if RS[:setting]
    klass = RS[:setting]
    Object.class_eval do
      remove_const(klass.name) if klass
    end  
  end
  RS[:setting] = nil
  RaiseSettings.module_eval do
    remove_const("Adapter") if defined?(Adapter)
  end
  load File.join(path, "..", "common.rb")
  load File.join(path, "map.rb")
  load File.join(path, "model.rb")

else
  require File.join(path, "..", "common")
  require File.join(path, "map")
  require File.join(path, "model")
end

