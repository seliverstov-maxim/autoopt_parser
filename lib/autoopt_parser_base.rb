class AutooptParserBase 
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
    raise 'Need define resource for class.'
  end
end

class AutooptOnlineBase < AutooptParserBase
  def resource
    "curl '#{@addr}'"
  end
end

class AutooptOflineBase < AutooptParserBase
  def resource
    "cat #{@addr}"
  end
end

p AutooptOnlineBase.new('http://www.autoopt.ru/map.php').open()
