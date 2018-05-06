require "application_system_test_case"

class Reservation2ServicesTest < ApplicationSystemTestCase
  setup do
    @reservation2_service = reservation2_services(:one)
  end

  test "visiting the index" do
    visit reservation2_services_url
    assert_selector "h1", text: "Reservation2 Services"
  end

  test "creating a Reservation2 service" do
    visit reservation2_services_url
    click_on "New Reservation2 Service"

    fill_in "Reservation", with: @reservation2_service.reservation_id
    fill_in "Service", with: @reservation2_service.service_id
    click_on "Create Reservation2 service"

    assert_text "Reservation2 service was successfully created"
    click_on "Back"
  end

  test "updating a Reservation2 service" do
    visit reservation2_services_url
    click_on "Edit", match: :first

    fill_in "Reservation", with: @reservation2_service.reservation_id
    fill_in "Service", with: @reservation2_service.service_id
    click_on "Update Reservation2 service"

    assert_text "Reservation2 service was successfully updated"
    click_on "Back"
  end

  test "destroying a Reservation2 service" do
    visit reservation2_services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reservation2 service was successfully destroyed"
  end
end
