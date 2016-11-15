require 'rails_helper'

RSpec.describe "restaurants/all.html.erb", type: :view do

  before(:each) do
    @dishoom = Restaurant.create!(name:"Dishoom", description:"tasty indian food, love the black dal", location: "old street")
    @dishoom_review = Review.create!(rating: "4", comment: "great food, big queue", restaurant_id: @dishoom.id)
  end

  feature "listing all restaurants" do
    scenario "I can list all saved restaurants" do
      visit '/restaurants/all'
      expect(page).to have_content("Dishoom")
      expect(page).to have_content("tasty indian food, love the black dal")
      expect(page).to have_content("old street")
    end
    scenario "I can see all listed reviews per restaurant" do
      visit '/restaurants/all'
      expect(page).to have_content("****")
      expect(page).to have_content("great food, big queue")
    end
  end
end
