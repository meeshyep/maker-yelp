require 'rails_helper'

RSpec.describe "restaurants/_login_items.html.erb", type: :view do
  scenario "user can login" do
    visit 'restaurants/new'
    expect(page).to have_content("Add restaurant")
  end
end
