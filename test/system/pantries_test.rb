require "application_system_test_case"

class PantriesTest < ApplicationSystemTestCase
  setup do
    @pantry = pantries(:one)
  end

  test "visiting the index" do
    visit pantries_url
    assert_selector "h1", text: "Pantries"
  end

  test "should create pantry" do
    visit pantries_url
    click_on "New pantry"

    click_on "Create Pantry"

    assert_text "Pantry was successfully created"
    click_on "Back"
  end

  test "should update Pantry" do
    visit pantry_url(@pantry)
    click_on "Edit this pantry", match: :first

    click_on "Update Pantry"

    assert_text "Pantry was successfully updated"
    click_on "Back"
  end

  test "should destroy Pantry" do
    visit pantry_url(@pantry)
    click_on "Destroy this pantry", match: :first

    assert_text "Pantry was successfully destroyed"
  end
end
