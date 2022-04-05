require "application_system_test_case"

class FriendstablesTest < ApplicationSystemTestCase
  setup do
    @friendstable = friendstables(:one)
  end

  test "visiting the index" do
    visit friendstables_url
    assert_selector "h1", text: "Friendstables"
  end

  test "creating a Friendstable" do
    visit friendstables_url
    click_on "New Friendstable"

    fill_in "Email", with: @friendstable.email
    fill_in "First name", with: @friendstable.first_name
    fill_in "Last name", with: @friendstable.last_name
    fill_in "Phone", with: @friendstable.phone
    fill_in "Twitter", with: @friendstable.twitter
    click_on "Create Friendstable"

    assert_text "Friendstable was successfully created"
    click_on "Back"
  end

  test "updating a Friendstable" do
    visit friendstables_url
    click_on "Edit", match: :first

    fill_in "Email", with: @friendstable.email
    fill_in "First name", with: @friendstable.first_name
    fill_in "Last name", with: @friendstable.last_name
    fill_in "Phone", with: @friendstable.phone
    fill_in "Twitter", with: @friendstable.twitter
    click_on "Update Friendstable"

    assert_text "Friendstable was successfully updated"
    click_on "Back"
  end

  test "destroying a Friendstable" do
    visit friendstables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Friendstable was successfully destroyed"
  end
end
