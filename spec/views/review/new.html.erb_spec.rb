require 'rails_helper'
RSpec.describe "review/new.html.erb", type: :view do
  feature "can add a review" do
    scenario "user can add review to restaurat" do
      create_user
      add_restaurant
      click_link"Logout"
      create_user2
      submit_review
      expect(page).to have_content("😋😋😋😋")
      expect(page).to have_content("great food, big queue")
    end
  end
    scenario "user cannot add review to restaurant that they have already reviewed" do
      create_user
      add_restaurant
      click_link"Logout"
      create_user2
      submit_review
      submit_review
      expect(page).to have_content"Have you left a"
  end
end
