require 'spec_helper'

RSpec.describe LoginController, :type => :controller do
  let(:user) { users(:user1) }
  let(:email) { user.email }

  describe 'POST create' do
    let(:parameters) { { user: { email: user.email } } }

    before do
      post :create, parameters
    end

    context 'when everything is ok' do
      it do
        expect(response).to have_http_status(:success)
      end

      it 'stores user credentials' do
        expect(cookies.signed[:credentials]).to eq(email)
      end

      it 'does not recreate user' do
        expect { post :create, parameters }.not_to change { User.count }
      end
    end

    context 'when user does not exist' do
      let(:new_email) { 'new_email@new_server.com' }

      it 'creates new user' do
        expect { post :create, { user: { email: new_email } } }.to change { User.count }
      end
    end

    context 'when user attributes are missed' do
      let(:parameters) { {} }
      it do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'GET new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET destroy' do
    it 'returns http success' do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
