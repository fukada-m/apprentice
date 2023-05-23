# frozen_string_literal: true

require 'minitest/autorun'
require 'stringio'
require_relative '../app'

# appのテストが記載されています
class AppTest < Minitest::Test
  def setup
    @app = App.new
  end

  def test_start
    original_stdn = $stdin
    $stdin = StringIO.new("1\n2\n3\n4\n5\n6\nhoge\n99\n")
    assert_nil @app.start
    # assert_equal
  ensure
    $stdin = original_stdn
  end
end
