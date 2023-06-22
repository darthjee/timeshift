# frozen_string_literal: true

require 'spec_helper'

describe ClientsController do
  let(:session) { create(:session, user: logged_user) }
  let(:expected_json) do
    Client::Decorator.new(expected_object).to_json
  end
  let(:logged_user) { create(:user) }

  before do
    controller.send(:cookies).signed[:session] = session.id
  end

  describe 'GET new' do
    render_views

    context 'when requesting html and ajax is true', :cached do
      before do
        get :new, params: { format: :html, ajax: true }
      end

      it { expect(response).to be_successful }

      it { expect(response).to render_template('clients/new') }
    end

    context 'when requesting html and ajax is false' do
      before do
        get :new
      end

      it do
        expect(response).to redirect_to('#/clients/new')
      end
    end

    context 'when requesting json', :not_cached do
      let(:expected_object) { Client.new(user: logged_user) }

      before do
        get :new, params: { format: :json }
      end

      it { expect(response).to be_successful }

      it 'returns clients serialized' do
        expect(response.body).to eq(expected_json)
      end
    end
  end

  describe 'GET index' do
    let(:clients_count) { 1 }
    let(:parameters) { {} }

    render_views

    before { create_list(:client, clients_count, user: logged_user) }

    context 'when requesting json', :not_cached do
      let(:expected_object) { logged_user.clients }

      before do
        get :index, params: parameters.merge(format: :json)
      end

      it { expect(response).to be_successful }

      it 'returns clients serialized' do
        expect(response.body).to eq(expected_json)
      end

      it 'adds page header' do
        expect(response.headers['page']).to eq(1)
      end

      it 'adds pages header' do
        expect(response.headers['pages']).to eq(1)
      end

      it 'adds per_page header' do
        expect(response.headers['per_page']).to eq(10)
      end

      context 'when there are too many clients' do
        let(:clients_count) { 21 }
        let(:expected_object) { Client.limit(10) }

        it { expect(response).to be_successful }

        it 'returns clients serialized' do
          expect(response.body).to eq(expected_json)
        end

        it 'adds page header' do
          expect(response.headers['page']).to eq(1)
        end

        it 'adds pages header' do
          expect(response.headers['pages']).to eq(3)
        end

        it 'adds per_page header' do
          expect(response.headers['per_page']).to eq(10)
        end
      end

      context 'when requesting last page' do
        let(:clients_count) { 21 }
        let(:expected_object) { Client.offset(20) }
        let(:parameters)      { { page: 3 } }

        it { expect(response).to be_successful }

        it 'returns clients serialized' do
          expect(response.body).to eq(expected_json)
        end

        it 'adds page header' do
          expect(response.headers['page']).to eq(3)
        end

        it 'adds pages header' do
          expect(response.headers['pages']).to eq(3)
        end

        it 'adds per_page header' do
          expect(response.headers['per_page']).to eq(10)
        end
      end
    end

    context 'when requesting html and ajax is true', :cached do
      before do
        get :index, params: { format: :html, ajax: true }
      end

      it { expect(response).to be_successful }

      it { expect(response).to render_template('clients/index') }
    end

    context 'when requesting html and ajax is false' do
      before do
        get :index
      end

      it { expect(response).to redirect_to('#/clients') }
    end
  end

  describe 'POST create' do
    context 'when requesting json format' do
      let(:client) { Client.last }

      let(:parameters) do
        { format: :json, client: payload }
      end

      let(:payload)         { { name: 'my client' } }
      let(:expected_object) { client }

      it do
        post :create, params: parameters

        expect(response).to be_successful
      end

      it do
        expect { post :create, params: parameters }
          .to change(Client, :count)
          .by(1)
      end

      context 'when the request is completed' do
        before { post :create, params: parameters }

        let(:client) { Client.last }

        let(:client_attributes) do
          client.attributes.reject do |key, _|
            %w[id created_at updated_at user_id]
              .include? key
          end
        end

        let(:expected_client_attributes) do
          payload.stringify_keys
        end

        it 'returns created client' do
          expect(response.body).to eq(expected_json)
        end

        it 'creates a correct client' do
          expect(client_attributes)
            .to eq(expected_client_attributes)
        end
      end

      context 'when there are validation errors' do
        let(:payload) { { name: '' } }

        let(:client_attributes) do
          payload
        end

        let(:client) do
          logged_user.clients.new(client_attributes).tap(&:valid?)
        end

        it 'is not successful' do
          post :create, params: parameters

          expect(response).not_to be_successful
        end

        it 'does not create a new client' do
          expect { post :create, params: parameters }
            .not_to change(Client, :count)
        end

        it 'returns client with errors' do
          post :create, params: parameters

          expect(response.body).to eq(expected_json)
        end
      end
    end
  end

  describe 'GET show' do
    render_views

    let(:client)    { create(:client, user: logged_user) }
    let(:client_id) { client.id }

    context 'when requesting html and ajax is true', :cached do
      before do
        get :show, params: { format: :html, ajax: true, id: client_id }
      end

      it { expect(response).to be_successful }

      it { expect(response).to render_template('clients/show') }
    end

    context 'when requesting html and ajax is false' do
      before do
        get :show, params: { id: client_id }
      end

      it do
        expect(response).to redirect_to("#/clients/#{client_id}")
      end
    end

    context 'when requesting json', :not_cached do
      let(:expected_object) { client }

      before do
        get :show, params: { id: client_id, format: :json }
      end

      it { expect(response).to be_successful }

      it 'returns clients serialized' do
        expect(response.body).to eq(expected_json)
      end
    end
  end
end
