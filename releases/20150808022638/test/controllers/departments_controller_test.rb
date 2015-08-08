require 'test_helper'

class DepartmentsControllerTest < ActionController::TestCase
  test "should get phongdaotao" do
    get :phongdaotao
    assert_response :success
  end

  test "should get phongtaivu" do
    get :phongtaivu
    assert_response :success
  end

  test "should get tochuchanhchinh" do
    get :tochuchanhchinh
    assert_response :success
  end

  test "should get quanlihs" do
    get :quanlihs
    assert_response :success
  end

  test "should get qttb" do
    get :qttb
    assert_response :success
  end

end
