require 'test_helper'

class Reservation2ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation2_service = reservation2_services(:one)
  end

  test "should get index" do
    get reservation2_services_url
    assert_response :success
  end

  test "should get new" do
    get new_reservation2_service_url
    assert_response :success
  end

  test "should create reservation2_service" do
    assert_difference('Reservation2Service.count') do
      post reservation2_services_url, params: { reservation2_service: { reservation_id: @reservation2_service.reservation_id, service_id: @reservation2_service.service_id } }
    end

    assert_redirected_to reservation2_service_url(Reservation2Service.last)
  end

  test "should show reservation2_service" do
    get reservation2_service_url(@reservation2_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservation2_service_url(@reservation2_service)
    assert_response :success
  end

  test "should update reservation2_service" do
    patch reservation2_service_url(@reservation2_service), params: { reservation2_service: { reservation_id: @reservation2_service.reservation_id, service_id: @reservation2_service.service_id } }
    assert_redirected_to reservation2_service_url(@reservation2_service)
  end

  test "should destroy reservation2_service" do
    assert_difference('Reservation2Service.count', -1) do
      delete reservation2_service_url(@reservation2_service)
    end

    assert_redirected_to reservation2_services_url
  end
end
