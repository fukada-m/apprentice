require 'minitest/autorun'
require_relative '../create_table'

class DB_set_up_Test < Minitest::Test
	def test_file_read
		assert_equal "-- CREATE文\n", file_read_test('./ruby/sql/create_table.sql')
		assert_equal "-- チャンネルとジャンルを挿入\n", file_read_test('./ruby/sql/insert_channel_and_genre.sql')
		assert_equal "-- アニメ番組のデータ\n", file_read_test('./ruby/sql/insert_anime_data.sql')
	end
end

