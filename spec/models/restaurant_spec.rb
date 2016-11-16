require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  describe "New restaurant" do
    let(:user) { FactoryGirl.create(:user) }

    it "has a name" do
      dishoom = Restaurant.create!(name: "Dishoom", description: "yum", location: "Old Street", user_id: user.id)
      expect(dishoom.name).to eq("Dishoom")
    end
  end
end
