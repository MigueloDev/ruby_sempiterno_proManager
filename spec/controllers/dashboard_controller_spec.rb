require "rails_helper"

RSpec.describe DashboardController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe "GET #index" do
    context "when user is not signed in" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is signed in" do
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end
