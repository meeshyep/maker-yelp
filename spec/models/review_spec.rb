require 'rails_helper'

RSpec.describe Review, type: :model do

  describe "Create a review" do
    let(:user) { FactoryGirl.create(:user) }

    it "has a comment" do
      @dishoom = Restaurant.create!(name:"Dishoom", description:"tasty indian food, love the black dal", location: "old street", user_id: user.id)
      @dishoom_review = Review.create!(rating: "4", comment: "great food, big queue", restaurant_id: @dishoom.id)
      expect(@dishoom_review.comment).to eq("great food, big queue")
    end
  end
end
