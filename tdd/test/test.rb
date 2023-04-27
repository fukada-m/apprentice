require 'minitest/autorun'

class SampleTest < Minitest::Test
	#メソッド名は'test'から必ず始める
	def test_sample
        a = 0
        b = 'pati'
		# b == a　ならパス
		assert_equal 'RUBY', 'ruby'.upcase
        assert "RUBY" == "ruby".upcase

		# aが真ならパス
		assert a == 0

		# bが偽ならパス
		refute b == ""
    end
end