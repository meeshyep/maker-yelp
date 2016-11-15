require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it "has a name" do
    dishoom = Restaurant.create!(name: "Dishoom", description: "yum", location: "Old Street")
    expect(dishoom.name).to eq("Dishoom")
  end
end
