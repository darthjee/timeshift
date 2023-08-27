# frozen_string_literal: true

require 'spec_helper'

describe Admin::SettupController do
  let(:parameters) { {} }

  describe 'GET index' do
    render_views

    context 'when passing ajax' do
      let(:parameters) { { ajax: true } }

      context 'when it has not been set yet' do
        before do
          get :index, params: parameters
        end

        it { expect(response).to be_successful }

        it { expect(response).to render_template('admin/settup/index') }
      end

      context 'when it has been set already' do
        before do
          allow(Settings).to receive(:set).and_return(true)

          get :index, params: parameters
        end

        it { expect(response).to redirect_to('/#/') }

        it { expect(response).not_to render_template('admin/settup/index') }
      end
    end

    context 'when not passing ajax' do
      context 'when it has not been set yet' do
        before do
          get :index, params: parameters
        end

        it { expect(response).to redirect_to('#/admin/settup') }

        it { expect(response).not_to render_template('admin/settup/index') }
      end

      context 'when it has been set already' do
        before do
          allow(Settings).to receive(:set).and_return(true)

          get :index, params: parameters
        end

        it { expect(response).to redirect_to('/#/') }

        it { expect(response).not_to render_template('admin/settup/index') }
      end
    end
  end
end
