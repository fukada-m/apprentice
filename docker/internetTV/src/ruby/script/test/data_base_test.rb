require 'minitest/autorun'
require_relative '../app'

class DataBaseTest < Minitest::Test
	
	def setup
		@app = App.new
	end

	def test_sql
		assert  @app.decide_sql(99)
		# assert_equal 
	end
end

