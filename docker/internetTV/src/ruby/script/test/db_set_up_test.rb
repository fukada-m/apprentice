require 'minitest/autorun'
require_relative '../create_table'

class DB_set_up_Test < Minitest::Test
	def test_file_read
		assert_equal "-- CREATE文\n", file_read
	end
end

