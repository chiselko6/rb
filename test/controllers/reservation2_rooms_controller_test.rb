require 'test_helper'

class Reservation2RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation2_room = reservation2_rooms(:one)
  end

  test "should get index" do
    get reservation2_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_reservation2_room_url
    assert_response :success
  end

  test "should create reservation2_room" do
    assert_difference('Reservation2Room.count') do
      post reservation2_rooms_url, params: { reservation2_room: { reservation_id: @reservation2_room.reservation_id, room_id: @reservation2_room.room_id } }
    end

    assert_redirected_to reservation2_room_url(Reservation2Room.last)
  end

  test "should show reservation2_room" do
    get reservation2_room_url(@reservation2_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservation2_room_url(@reservation2_room)
    assert_response :success
  end

  test "should update reservation2_room" do
    patch reservation2_room_url(@reservation2_room), params: { reservation2_room: { reservation_id: @reservation2_room.reservation_id, room_id: @reservation2_room.room_id } }
    assert_redirected_to reservation2_room_url(@reservation2_room)
  end

  test "should destroy reservation2_room" do
    assert_difference('Reservation2Room.count', -1) do
      delete reservation2_room_url(@reservation2_room)
    end

    assert_redirected_to reservation2_rooms_url
  end
end
