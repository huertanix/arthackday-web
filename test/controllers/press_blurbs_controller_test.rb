require 'test_helper'

class PressBlurbsControllerTest < ActionController::TestCase
  setup do
    @press_blurb = press_blurbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:press_blurbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create press_blurb" do
    assert_difference('PressBlurb.count') do
      post :create, press_blurb: { headline: @press_blurb.headline, logo_uri: @press_blurb.logo_uri, source_name: @press_blurb.source_name, source_url: @press_blurb.source_url }
    end

    assert_redirected_to press_blurb_path(assigns(:press_blurb))
  end

  test "should show press_blurb" do
    get :show, id: @press_blurb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @press_blurb
    assert_response :success
  end

  test "should update press_blurb" do
    patch :update, id: @press_blurb, press_blurb: { headline: @press_blurb.headline, logo_uri: @press_blurb.logo_uri, source_name: @press_blurb.source_name, source_url: @press_blurb.source_url }
    assert_redirected_to press_blurb_path(assigns(:press_blurb))
  end

  test "should destroy press_blurb" do
    assert_difference('PressBlurb.count', -1) do
      delete :destroy, id: @press_blurb
    end

    assert_redirected_to press_blurbs_path
  end
end
