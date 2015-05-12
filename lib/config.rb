module Config
  # again - it's a singleton, thus implemented as a self-extended module
  extend self

  @_config = {}

  # This is the main point of entry - we call Config.load! and provide
  # a name of the file to read as it's argument. We can also pass in some
  # options, but at the moment it's being used to allow per-environment
  # overrides in Rails
  def load!(filename: nil, env: 'development')
    template = ERB.new(File.new(filename).read)
    newsets = YAML.load(template.result(binding)).with_indifferent_access
    newsets = newsets[env] if env && newsets[env]
    deep_merge!(@_config, newsets)
  end

  # Deep merging of hashes
  # deep_merge by Stefan Rusterholz, see http://www.ruby-forum.com/topic/142809
  def deep_merge!(target, data)
    merger = proc{|key, v1, v2|
      Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : v2
    }
    target.merge! data, &merger
  end

  def method_missing(name, *args, &block)
    @_config[name.to_s] || nil
  end
end