# frozen_string_literal: true

require 'spec_helper'

fdescribe Admin::SettupController do
  describe 'GET home' do
    render_views

    context 'when passing ajax' do
      let(:parameters) { { ajax: true } }

      context 'when it has not been set yet' do
        before do
          get :home, params: parameters
        end

        it { expect(response).to be_successful }

        it { expect(response).to render_template('admin/settup/home') }
      end

      context 'when it has been set already' do
        before do
          allow(Settings).to receive(:set).and_return(true)

          get :home, params: parameters
        end

        it { expect(response).to redirect_to('/#/') }

        it { expect(response).not_to render_template('admin/settup/home') }
      end
    end
  end
end
