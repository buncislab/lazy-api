require 'test_helper'

class KelasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kelas = kelases(:one)
  end

  test "should get index" do
    get kelases_url, as: :json
    assert_response :success
  end

  test "should create kelas" do
    assert_difference('Kelas.count') do
      post kelases_url, params: { kelas: { description: @kelas.description, title: @kelas.title } }, as: :json
    end

    assert_response 201
  end

  test "should show kelas" do
    get kelas_url(@kelas), as: :json
    assert_response :success
  end

  test "should update kelas" do
    patch kelas_url(@kelas), params: { kelas: { description: @kelas.description, title: @kelas.title } }, as: :json
    assert_response 200
  end

  test "should destroy kelas" do
    assert_difference('Kelas.count', -1) do
      delete kelas_url(@kelas), as: :json
    end

    assert_response 204
  end
end
