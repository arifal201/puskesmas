require 'test_helper'

class PasiensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pasien = pasiens(:one)
  end

  test "should get index" do
    get pasiens_url
    assert_response :success
  end

  test "should get new" do
    get new_pasien_url
    assert_response :success
  end

  test "should create pasien" do
    assert_difference('Pasien.count') do
      post pasiens_url, params: { pasien: { alamat: @pasien.alamat, name: @pasien.name, nik: @pasien.nik } }
    end

    assert_redirected_to pasien_url(Pasien.last)
  end

  test "should show pasien" do
    get pasien_url(@pasien)
    assert_response :success
  end

  test "should get edit" do
    get edit_pasien_url(@pasien)
    assert_response :success
  end

  test "should update pasien" do
    patch pasien_url(@pasien), params: { pasien: { alamat: @pasien.alamat, name: @pasien.name, nik: @pasien.nik } }
    assert_redirected_to pasien_url(@pasien)
  end

  test "should destroy pasien" do
    assert_difference('Pasien.count', -1) do
      delete pasien_url(@pasien)
    end

    assert_redirected_to pasiens_url
  end
end
