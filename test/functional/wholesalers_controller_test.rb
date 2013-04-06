require 'test_helper'

class WholesalersControllerTest < ActionController::TestCase
  setup do
    @wholesaler = wholesalers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wholesalers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wholesaler" do
    assert_difference('Wholesaler.count') do
      post :create, wholesaler: { address: @wholesaler.address, name: @wholesaler.name }
    end

    assert_redirected_to wholesaler_path(assigns(:wholesaler))
  end

  test "should show wholesaler" do
    get :show, id: @wholesaler
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wholesaler
    assert_response :success
  end

  test "should update wholesaler" do
    put :update, id: @wholesaler, wholesaler: { address: @wholesaler.address, name: @wholesaler.name }
    assert_redirected_to wholesaler_path(assigns(:wholesaler))
  end

  test "should destroy wholesaler" do
    assert_difference('Wholesaler.count', -1) do
      delete :destroy, id: @wholesaler
    end

    assert_redirected_to wholesalers_path
  end
end
