class ParserBase
  attr_accessor :url, :grep_pattern, :encode_to

  def initialize(addr, pattern = nil, encode_to = nil)
    @addr = addr
    @pattern = pattern ? pattern : 'auto/catalog'
    @encode_to = encode_to ? encode_to : 'UTF-8'
  end

  def open
    `#{query}`
  end

  def query
    [ resource,
      "enca -cx #{@encode_to}",
      "grep '#{@pattern}'",
      "tr '\n' ' '",
      "tr '\t' ' '",
      "tr -s ' '"
    ].join(' | ')
  end

  def resource
    #Configs.get(:resource)
    "cat '#{@addr}'"
  end
end