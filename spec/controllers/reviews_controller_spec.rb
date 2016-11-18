require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

  describe "GET #new" do
    let(:user) { FactoryGirl.create(:user) }
      it "returns http success" do
       Restaurant.create(name:"Rosie", location:"home", description:"reindeers")
        sign_in user
        get :new, :restaurant_id => 1
        expect(response).to have_http_status(:success)
    end
  end

end
