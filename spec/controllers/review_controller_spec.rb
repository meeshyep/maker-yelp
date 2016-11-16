require 'rails_helper'

RSpec.describe ReviewController, type: :controller do

  describe "GET #new" do
    let(:user) { FactoryGirl.create(:user) }
      it "returns http success" do
        sign_in user
        get :new
        expect(response).to have_http_status(:success)
    end
  end

end
