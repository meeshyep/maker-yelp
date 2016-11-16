require 'rails_helper'

RSpec.describe "restaurants/all.html.erb", type: :view do
  feature "listing all restaurants" do
    scenario "I can list all saved restaurants" do
      Restaurant.create!(name:"Dishoom", description:"tasty indian food, love the black dal", location: "old street")
      visit '/restaurants/all'
      expect(page).to have_content("Dishoom")
      expect(page).to have_content("tasty indian food, love the black dal")
      expect(page).to have_content("old street")
    end
  end
end
