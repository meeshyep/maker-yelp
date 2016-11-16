require 'rails_helper'

RSpec.describe "restaurants/new.html.erb", type: :view do
  scenario "user can see the create restaurant form" do
    visit 'restaurants/new'
    expect(page).to have_content("Add restaurant")
  end
end
