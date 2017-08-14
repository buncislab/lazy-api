require 'test_helper'

class MaterisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @materi = materis(:one)
  end

  test "should get index" do
    get materis_url, as: :json
    assert_response :success
  end

  test "should create materi" do
    assert_difference('Materi.count') do
      post materis_url, params: { materi: { description: @materi.description, file: @materi.file, kelas_id: @materi.kelas_id, title: @materi.title, user_id: @materi.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show materi" do
    get materi_url(@materi), as: :json
    assert_response :success
  end

  test "should update materi" do
    patch materi_url(@materi), params: { materi: { description: @materi.description, file: @materi.file, kelas_id: @materi.kelas_id, title: @materi.title, user_id: @materi.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy materi" do
    assert_difference('Materi.count', -1) do
      delete materi_url(@materi), as: :json
    end

    assert_response 204
  end
end
