module MerbSettings
  module ScopedHelpers

    def self.included(base)
      base.send(:include, InstanceMethods)
    end

    module InstanceMethods
      def setting(var, val=nil)
        type = self.class
        key = self.to_param
        if val
          MS[:setting].setter(var,val, {:type => type, :key => key})
        else
          MS[:setting].getter({:name => var,:type => type, :key => key})
        end
      end

      def settings
        type = self.class
        key = self.to_param
        MS[:setting].getter({:type => type, :key => key})
      end
    end

  end # ScopedHelpers
end

