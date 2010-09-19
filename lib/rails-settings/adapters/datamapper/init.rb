require 'dm-validations'
require 'dm-timestamps'

path = File.dirname(__FILE__)

if Rails.env?(:test)
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
  load path / ".." / "common.rb"
  load path / "map.rb"
  load path / "model.rb"

else
  require path / ".." / "common"
  require path / "map"
  require path / "model"
end

