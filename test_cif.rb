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
  
  def test_get_with_correct_cif
    get '/B91674176'
    assert_equal 'true', last_response.body
  end
  
  def test_get_with_wrong_cif
    get '/B91674178'
    assert_equal 'false', last_response.body
  end
  
  def test_get_for_A
    get '/A5881850'
    assert_equal '1', last_response.body
  end

  def test_get_for_B
    pending "debe devolver un cif válido para Sociedades anónimas."
  end
  
  def test_get_for_B
    pending "debe devolver un cif válido para Sociedades de responsabilidad limitada."
  end
  
  def test_get_for_C
    pending "debe devolver un cif válido para Sociedades colectivas."
  end
  
  def test_get_for_D
    pending "debe devolver un cif válido para Sociedades comanditarias."
  end
  
  def test_get_for_E
    pending "debe devolver un cif válido para Comunidades de bienes."
  end
  
  def test_get_for_F
    get '/F-4107226'
    assert_equal '5', last_response.body
  end
  
  def test_get_for_G
    get '/G-7401165'
    assert_equal '1', last_response.body
  end

  def test_get_for_H
    pending "debe devolver un cif válido para Comunidades de propietarios en régimen de propiedad horizontal."
  end    

  def test_get_for_N
    pending "debe devolver un cif válido para Entidades no residentes."
  end    

  def test_get_for_P
    pending "debe devolver un cif válido para Corporaciones locales."
  end    

  def test_get_for_Q
    pending "debe devolver un cif válido para Organismos autónomos estatales o no, y asimilados, y congregaciones e instituciones religiosas."
    get '/Q9155020'
    assert_equal 'B', last_response.body
  end    

  def test_get_for_S
    get '/S2800568'
    assert_equal 'D', last_response.body
  end    

  def test_get_for_U
    pending "debe devolver un cif válido para Uniones Temporales de Empresas."
  end    

  def test_get_for_V
    get '/V9146054'
    assert_equal '3', last_response.body
  end    

  def test_get_for_W
    pending "debe devolver un cif válido para Reservado a establecimientos permanentes de entidades no residentes en territorio español."
  end    

  def test_get_random
    pending 'debe devolver un cif valido al llamar a /random'
  end
end