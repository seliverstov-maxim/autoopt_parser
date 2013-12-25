class Configs < BaseConfig
  @config = {
      resource: "cat '#{@addr}'"
  }
end