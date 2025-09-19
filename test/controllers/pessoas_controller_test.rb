require "test_helper"

class PessoasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pessoa = pessoas(:one)
  end

  test "should get index" do
    get pessoas_url, as: :json
    assert_response :success
  end

  test "should create pessoa" do
    assert_difference("Pessoa.count") do
      post pessoas_url, params: { pessoa: { cpf: @pessoa.cpf, email: @pessoa.email, endereco_id: @pessoa.endereco_id, nome: @pessoa.nome, telefone: @pessoa.telefone } }, as: :json
    end

    assert_response :created
  end

  test "should show pessoa" do
    get pessoa_url(@pessoa), as: :json
    assert_response :success
  end

  test "should update pessoa" do
    patch pessoa_url(@pessoa), params: { pessoa: { cpf: @pessoa.cpf, email: @pessoa.email, endereco_id: @pessoa.endereco_id, nome: @pessoa.nome, telefone: @pessoa.telefone } }, as: :json
    assert_response :success
  end

  test "should destroy pessoa" do
    assert_difference("Pessoa.count", -1) do
      delete pessoa_url(@pessoa), as: :json
    end

    assert_response :no_content
  end
end
