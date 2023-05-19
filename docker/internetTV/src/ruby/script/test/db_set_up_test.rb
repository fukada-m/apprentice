require 'minitest/autorun'
require_relative '../create_table'

class DB_set_up_Test < Minitest::Test
	
	def setup
		@create_table = Create_table.new
	end

	def test_sql
		assert_equal "アニメ", @create_table.sql_test
	end
end

