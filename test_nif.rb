require 'nif'
require 'test/unit'
require 'rack/test'
require 'redgreen'
require 'pending'


set :environment, :test


class TestNif < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_get_default
    get '/'
    assert last_response.ok?
  end
  
  def test_llamar_a_un_numero_de_8_cifras
    get '/12345678'
    assert_equal 'Z', last_response.body
  end

  def test_llamar_a_un_numero_de_9_cifras
    get '/123456789'
    assert_equal 'false', last_response.body
  end
  
  def test_llamar_a_un_numero_de_7_cifras
    get '/1234567'
    assert_equal 'false', last_response.body
  end
  
  def test_get_with_correct_nif
    get '/12345678Z'
    assert_equal 'true', last_response.body
  end
  
  def test_get_with_wrong_nif
    get '/12345678W'
    assert_equal 'false', last_response.body
    
  end
  
  def test_get_random
    pending 'debe devolver un nif valido al llamar a /random'
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