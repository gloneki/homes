require 'test_helper'

class SettingShopsControllerTest < ActionController::TestCase
  setup do
    @setting_shop = setting_shops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:setting_shops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create setting_shop" do
    assert_difference('SettingShop.count') do
      post :create, setting_shop: { city: @setting_shop.city, complement: @setting_shop.complement, country: @setting_shop.country, document: @setting_shop.document, email: @setting_shop.email, hour_service: @setting_shop.hour_service, localization: @setting_shop.localization, logo: @setting_shop.logo, name: @setting_shop.name, neighborhood: @setting_shop.neighborhood, number: @setting_shop.number, postal_code: @setting_shop.postal_code, showcase: @setting_shop.showcase, social_contact: @setting_shop.social_contact, state: @setting_shop.state, street: @setting_shop.street }
    end

    assert_redirected_to setting_shop_path(assigns(:setting_shop))
  end

  test "should show setting_shop" do
    get :show, id: @setting_shop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @setting_shop
    assert_response :success
  end

  test "should update setting_shop" do
    put :update, id: @setting_shop, setting_shop: { city: @setting_shop.city, complement: @setting_shop.complement, country: @setting_shop.country, document: @setting_shop.document, email: @setting_shop.email, hour_service: @setting_shop.hour_service, localization: @setting_shop.localization, logo: @setting_shop.logo, name: @setting_shop.name, neighborhood: @setting_shop.neighborhood, number: @setting_shop.number, postal_code: @setting_shop.postal_code, showcase: @setting_shop.showcase, social_contact: @setting_shop.social_contact, state: @setting_shop.state, street: @setting_shop.street }
    assert_redirected_to setting_shop_path(assigns(:setting_shop))
  end

  test "should destroy setting_shop" do
    assert_difference('SettingShop.count', -1) do
      delete :destroy, id: @setting_shop
    end

    assert_redirected_to setting_shops_path
  end
end
