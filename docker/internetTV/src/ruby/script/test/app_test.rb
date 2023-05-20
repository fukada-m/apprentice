require 'minitest/autorun'
require 'stringio'
require_relative '../app'

class AppTest < Minitest::Test
	
	def setup
		@app = App.new
	end

	def test_start
		original_stdn = $stdin
		$stdin = StringIO.new("99\n")
		assert_equal nil, @app.start
		# assert_equal 
	ensure
		$stdin = original_stdn
	end
end

