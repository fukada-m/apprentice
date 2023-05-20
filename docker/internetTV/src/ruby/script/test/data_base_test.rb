require 'minitest/autorun'
require_relative '../main'

class DataBaseTest < Minitest::Test
	
	def setup
		main = Main.new
	end

	def test_sql
		assert  decide_sql(99)
		# assert_equal 
	end
end

