require 'test_helper'

class PacientesControllerTest < ActionController::TestCase
  setup do
    @paciente = pacientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pacientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paciente" do
    assert_difference('Paciente.count') do
      post :create, paciente: { ativo: @paciente.ativo, convenio: @paciente.convenio, cpf: @paciente.cpf, email: @paciente.email, estadocivil: @paciente.estadocivil, idade: @paciente.idade, nome: @paciente.nome, sexo: @paciente.sexo, telc: @paciente.telc, telf: @paciente.telf }
    end

    assert_redirected_to paciente_path(assigns(:paciente))
  end

  test "should show paciente" do
    get :show, id: @paciente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paciente
    assert_response :success
  end

  test "should update paciente" do
    patch :update, id: @paciente, paciente: { ativo: @paciente.ativo, convenio: @paciente.convenio, cpf: @paciente.cpf, email: @paciente.email, estadocivil: @paciente.estadocivil, idade: @paciente.idade, nome: @paciente.nome, sexo: @paciente.sexo, telc: @paciente.telc, telf: @paciente.telf }
    assert_redirected_to paciente_path(assigns(:paciente))
  end

  test "should destroy paciente" do
    assert_difference('Paciente.count', -1) do
      delete :destroy, id: @paciente
    end

    assert_redirected_to pacientes_path
  end
end
