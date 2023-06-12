class ApplicationController < ActionController::Base
  def test
    render html: "hello, world!"
  end
end
