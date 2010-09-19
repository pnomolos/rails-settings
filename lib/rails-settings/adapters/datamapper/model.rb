module RailsSettings
  module Adapter
    module DataMapper

      def self.included(base)
        # Ensure base is a resource
        base.send(:include, ::DataMapper::Resource) unless ::DataMapper::Resource > base

        base.send(:include, Map)
        base.send(:include, InstanceMethods )
        base.send(:include, Common)

        RS[:setting] = base
      end

      module InstanceMethods
      end

      module DefaultModelSetup

        def self.included(base)
          base.class_eval do
            property :id, Integer, :serial => true
            property :name, String
            property :value, String
            property :scope_id, String
            property :scope_type, String
            property :created_at, DateTime
            property :updated_at, DateTime

            validates_present :name
          end
        end
      end # DefaultModelSetup     
      

    end # DataMapper
  end # Adapter
end
