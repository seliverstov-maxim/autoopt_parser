class Configs < BaseConfig
  @config = {
      resource: "curl '#{@addr}'"
  }
end