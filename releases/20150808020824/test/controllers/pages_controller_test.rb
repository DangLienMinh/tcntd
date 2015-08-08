require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get gioithieu" do
    get :gioithieu
    assert_response :success
  end

  test "should get lienhe" do
    get :lienhe
    assert_response :success
  end

  test "should get thungo" do
    get :thungo
    assert_response :success
  end

  test "should get csvc" do
    get :csvc
    assert_response :success
  end

  test "should get kiemdinh" do
    get :kiemdinh
    assert_response :success
  end

end
