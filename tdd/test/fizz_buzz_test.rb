
require 'minitest/autorun'
require_relative 'fizz_buzz'

class FizzBuzzTest < Minitest::Test
    def test_fizz_buzz
        assert_equal "1", fizz_buzz(1)
        assert_equal "2", fizz_buzz(2)
        assert_equal "fizz", fizz_buzz(3)
        assert_equal "buzz", fizz_buzz(5)
        assert_equal "fizz buzz", fizz_buzz(15)
    end
end
