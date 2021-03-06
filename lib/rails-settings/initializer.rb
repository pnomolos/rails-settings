module RailsSettings

  # Clears the currently registered adapter list.  
  def self.clear_adapter_list!
    @_adapters = nil
  end

  # Registers an adapter.
  # @param [Symbol] name is the name of the adapter.  Supported adapters are :datamapper and :activerecord
  # @param [String] path is the path to the adapter.  The adapter path _directory_ should include an init.rb file
  # @param [Hash] opts an options hash
  def self.register_adapter(name, path, opts = {})
    adapters[name.to_sym] = opts.merge!(:path => path)
  end

  # @return [Hash] A hash of the adapters.  
  def self.adapters
    @_adapters ||= Hash.new{|h,k| h[k] = {}}
  end

  # Loads the adapter provided, or if not provided, the adapter set in the slices config
  # @param [Symbol | String] adapter The name of the adapter to load.  This must be registered
  # @raise [RuntimeError] Raises an error if the adapter is not registered.
  def self.load_adapter!(adapter = nil)
    # adapter ||= Rails.orm
    raise "RailsSettings: No Adapter Specified" if adapter.nil? || adapter.blank?

    # Check that the adapter is registered
    raise "RailsSettings: Adapter Not Registered - #{adapter}" unless adapters.keys.include?(adapter.to_sym)

    if Rails.env == 'test'
      load File.join(adapters[adapter.to_sym][:path], "init.rb")
    else
      require File.join(adapters[adapter.to_sym][:path], "init")
    end
  end
end
