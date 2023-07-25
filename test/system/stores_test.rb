require "application_system_test_case"

class StoresTest < ApplicationSystemTestCase
  setup do
    @store = stores(:one)
  end

  test "visiting the index" do
    visit stores_url
    assert_selector "h1", text: "Stores"
  end

  test "creating a Store" do
    visit stores_url
    click_on "New Store"

    fill_in "Address", with: @store.address
    fill_in "Close", with: @store.close
    fill_in "Id", with: @store.id
    check "Ktai coupon" if @store.ktai_coupon
    fill_in "Logo pic", with: @store.logo_pic
    fill_in "Name", with: @store.name
    fill_in "Open", with: @store.open
    fill_in "Photo url", with: @store.photo_url
    fill_in "Station", with: @store.station
    click_on "Create Store"

    assert_text "Store was successfully created"
    click_on "Back"
  end

  test "updating a Store" do
    visit stores_url
    click_on "Edit", match: :first

    fill_in "Address", with: @store.address
    fill_in "Close", with: @store.close
    fill_in "Id", with: @store.id
    check "Ktai coupon" if @store.ktai_coupon
    fill_in "Logo pic", with: @store.logo_pic
    fill_in "Name", with: @store.name
    fill_in "Open", with: @store.open
    fill_in "Photo url", with: @store.photo_url
    fill_in "Station", with: @store.station
    click_on "Update Store"

    assert_text "Store was successfully updated"
    click_on "Back"
  end

  test "destroying a Store" do
    visit stores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Store was successfully destroyed"
  end
end
