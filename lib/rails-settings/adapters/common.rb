module MerbSettings
  module Adapter
    module Common

      def self.included(base)
        #base.send(:include, InstanceMethods)
        base.send(:extend,  ClassMethods)
      end


      module InstanceMethods
      end

      module ClassMethods
        def method_missing(method, *args)
          method_name = method.to_s

          if method_name =~ /=$/
            #set a value for a variable
            var = method_name.gsub('=', '')
            val = args.first
            setter(var, val)
          else
            getter({:name => method_name})
          end
        end

        #destroy the specified settings record
        def destroy(var)
          var_name = var.to_s
          obj = getter({:name => var_name})
          val = obj.value
          obj.destroy
          val
        end

        #retrieve all settings as a hash
        def get_all
          vars = getter
          result = {}
          vars.each do |s|
            result[s.name] = YAML::load(s.value.to_s)
          end
          result
        end

      end

    end
  end
end
