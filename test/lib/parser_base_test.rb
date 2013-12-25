require "test/unit"
require "../../config/base_config"
require "../../config/test"
require "../../lib/parser/parser_base"

class TestParserBase < Test::Unit::TestCase

  def test_query
    ParserBase.new('../fixture/map.php').open
  end

end