require 'minitest/autorun'

def pati(n)
	n.to_i * 2
end

class SampleTest < Minitest::Test
	#メソッド名は'test'から必ず始める
	def test_pati
		assert_equal 2, pati('1')
		assert_equal 10, pati('5')
	end
end