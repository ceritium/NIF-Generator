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
  
  def test_get_with_only_number
    # get '/B9167417'
    # assert_equal '6', last_response.body
    pending 'only number'
  end
  
  def test_get_with_correct_cif
    # get '/B91674176'
    # assert_equal 'true', last_response.body
    pending "correct cif"
  end
  
  def test_get_with_wrong_cif
    # get '/B91674178'
    # assert_equal 'false', last_response.body
    pending "wrong cif"
  end
  
  def test_get_for_A
    # get '/A5881850'
    # assert_equal '1', last_response.body
    pending "A"
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
    pending "debe devolver un cif válido para Sociedades cooperativas."
  end
  
  def test_get_for_G
    pending "debe devolver un cif válido para Asociaciones y otros tipos no definidos."
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
    # Q9155020B
  end    

  def test_get_for_S
    pending "debe devolver un cif válido para Órganos de la Administración del Estado y Comunidades Autónomas."
  end    

  def test_get_for_U
    pending "debe devolver un cif válido para Uniones Temporales de Empresas."
  end    

  def test_get_for_V
    pending "debe devolver un cif válido para Otros tipos no definidos en el resto de claves."
  end    

  def test_get_for_W
    pending "debe devolver un cif válido para Reservado a establecimientos permanentes de entidades no residentes en territorio español."
  end    

  def test_get_random
    pending 'debe devolver un cif valido al llamar a /random'
  end
end