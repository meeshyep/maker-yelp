require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new when logged in" do
    let(:user) { FactoryGirl.create(:user) }

    it "returns http success" do
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new when logged out" do
    subject { get :new }

    it "redirects to #restaurants" do
      expect(subject).to redirect_to('/restaurants')
    end
  end

  describe "POST #create" do
    let(:user) { FactoryGirl.create(:user) }

    it "redirects to #restaurants" do
      sign_in user
      expect { post :create, :restaurant => { :name => "Best Restaurant", :description => "It's really great", :location => "2 Tower Hill"} }.to change { Restaurant.count }
    end
  end

end
