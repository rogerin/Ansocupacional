require 'test_helper'

class LogEmpresasControllerTest < ActionController::TestCase
  setup do
    @log_empresa = log_empresas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:log_empresas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create log_empresa" do
    assert_difference('LogEmpresa.count') do
      post :create, log_empresa: { empresa_id: @log_empresa.empresa_id, mensagem: @log_empresa.mensagem }
    end

    assert_redirected_to log_empresa_path(assigns(:log_empresa))
  end

  test "should show log_empresa" do
    get :show, id: @log_empresa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @log_empresa
    assert_response :success
  end

  test "should update log_empresa" do
    put :update, id: @log_empresa, log_empresa: { empresa_id: @log_empresa.empresa_id, mensagem: @log_empresa.mensagem }
    assert_redirected_to log_empresa_path(assigns(:log_empresa))
  end

  test "should destroy log_empresa" do
    assert_difference('LogEmpresa.count', -1) do
      delete :destroy, id: @log_empresa
    end

    assert_redirected_to log_empresas_path
  end
end
