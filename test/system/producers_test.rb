require "application_system_test_case"

class ProducersTest < ApplicationSystemTestCase
  setup do
    @producer = producers(:one)
  end

  test "visiting the index" do
    visit producers_url
    assert_selector "h1", text: "Producers"
  end

  test "should create producer" do
    visit producers_url
    click_on "New producer"

    fill_in "Name", with: @producer.name
    click_on "Create Producer"

    assert_text "Producer was successfully created"
    click_on "Back"
  end

  test "should update Producer" do
    visit producer_url(@producer)
    click_on "Edit this producer", match: :first

    fill_in "Name", with: @producer.name
    click_on "Update Producer"

    assert_text "Producer was successfully updated"
    click_on "Back"
  end

  test "should destroy Producer" do
    visit producer_url(@producer)
    click_on "Destroy this producer", match: :first

    assert_text "Producer was successfully destroyed"
  end
end
