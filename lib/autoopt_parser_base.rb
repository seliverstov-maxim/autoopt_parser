



class ParserOfline < ParserBase
  def resource
    "cat #{@addr}"
  end
end

p AutooptOnlineBase.new('http://www.autoopt.ru/map.php').open()
