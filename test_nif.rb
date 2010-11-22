require 'nif'
require 'test/unit'
require 'rack/test'
require 'redgreen'
class TestNif < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_get_default
    get '/'
    assert_equal 'Hello world!', last_response.body
  end
  # def test_my_default
  #   get '/'
  #   assert_equal 'Hello World!', last_response.body
  # end
  # 
  # def test_with_params
  #   get '/meet', :name => 'Frank'
  #   assert_equal 'Hello Frank!', last_response.body
  # end
  # 
  # def test_with_rack_env
  #   get '/', {}, 'HTTP_USER_AGENT' => 'Songbird'
  #   assert_equal "You're using Songbird!", last_response.body
  # end
end