require 'rails_helper'

RSpec.describe "restaurants/account.html.erb", type: :view do

  describe "Listing owner's restaurants" do
    scenario "The owner can only see their own restaurants" do
      visit '/restaurants/all'
      create_user
      add_restaurant
      click_link"Logout"
      create_user2
      add_restaurant2

      visit '/restaurants/account'
      expect(page).to have_content("Trade")
      expect(page).not_to have_content("Dishoom")
    end
  end
end
