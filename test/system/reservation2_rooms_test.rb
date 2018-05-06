require "application_system_test_case"

class Reservation2RoomsTest < ApplicationSystemTestCase
  setup do
    @reservation2_room = reservation2_rooms(:one)
  end

  test "visiting the index" do
    visit reservation2_rooms_url
    assert_selector "h1", text: "Reservation2 Rooms"
  end

  test "creating a Reservation2 room" do
    visit reservation2_rooms_url
    click_on "New Reservation2 Room"

    fill_in "Reservation", with: @reservation2_room.reservation_id
    fill_in "Room", with: @reservation2_room.room_id
    click_on "Create Reservation2 room"

    assert_text "Reservation2 room was successfully created"
    click_on "Back"
  end

  test "updating a Reservation2 room" do
    visit reservation2_rooms_url
    click_on "Edit", match: :first

    fill_in "Reservation", with: @reservation2_room.reservation_id
    fill_in "Room", with: @reservation2_room.room_id
    click_on "Update Reservation2 room"

    assert_text "Reservation2 room was successfully updated"
    click_on "Back"
  end

  test "destroying a Reservation2 room" do
    visit reservation2_rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reservation2 room was successfully destroyed"
  end
end
