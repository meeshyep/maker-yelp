require 'rails_helper'

RSpec.feature "restaurants/new.html.erb", type: :feature do
  scenario "user can see the create restaurant form" do
    visit 'restaurants/new'
    expect(page).to have_content("Add restaurant")
  end
end
