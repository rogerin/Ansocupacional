require 'test_helper'

class ConsultasControllerTest < ActionController::TestCase
  setup do
    @consulta = consultas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consultas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consulta" do
    assert_difference('Consulta.count') do
      post :create, consulta: { categoria_id: @consulta.categoria_id, empresa_id: @consulta.empresa_id, funcionario_id: @consulta.funcionario_id }
    end

    assert_redirected_to consulta_path(assigns(:consulta))
  end

  test "should show consulta" do
    get :show, id: @consulta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consulta
    assert_response :success
  end

  test "should update consulta" do
    put :update, id: @consulta, consulta: { categoria_id: @consulta.categoria_id, empresa_id: @consulta.empresa_id, funcionario_id: @consulta.funcionario_id }
    assert_redirected_to consulta_path(assigns(:consulta))
  end

  test "should destroy consulta" do
    assert_difference('Consulta.count', -1) do
      delete :destroy, id: @consulta
    end

    assert_redirected_to consultas_path
  end
end
