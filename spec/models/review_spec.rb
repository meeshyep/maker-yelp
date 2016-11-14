require 'rails_helper'

RSpec.describe Review, type: :model do
    it "has a comment" do
      review = Review.create!(comment: "This is such a yummy place!")
      expect(review.comment).to eq("This is such a yummy place!")
    end
end
