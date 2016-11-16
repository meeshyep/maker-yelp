require 'rails_helper'

RSpec.describe Review, type: :model do

    before(:each) do
      @dishoom = Restaurant.create!(name:"Dishoom", description:"tasty indian food, love the black dal", location: "old street")
      @dishoom_review = Review.create!(rating: "4", comment: "great food, big queue", restaurant_id: @dishoom.id)
    end

    it "has a comment" do
      expect(@dishoom_review.comment).to eq("great food, big queue")
    end
end
