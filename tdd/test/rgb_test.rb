require "minitest/autorun"

class RgbTest < Minitest::Test
    def test_to_hex
        asser_equal '#000000', to_hex(0, 0, 0) 
      
    end
end