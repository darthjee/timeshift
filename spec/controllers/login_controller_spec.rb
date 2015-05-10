require 'spec_helper'

RSpec.describe LoginController, :type => :controller do
  let(:user) { users(:user1) }
  let(:email) { user.email }

  describe "POST create" do
    let(:parameters) { { user: { email: user.email } } }

    context 'when everything is ok' do
      before do
        post :create, parameters
      end

      it do
        expect(response).to have_http_status(:success)
      end

      it "stores user credentials" do
        expect(cookies.signed[:credentials]).to eq(email)
      end
    end

    context 'when user attributes are missed' do
      let(:parameters) { {} }
      it do
        post :create, parameters
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
