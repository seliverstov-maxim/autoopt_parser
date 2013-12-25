class BaseConfig
  @config = nil
  def self.get(key)
    @config[key]
  end
end