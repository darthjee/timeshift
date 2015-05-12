require 'spec_helper'

describe StaticController do
  pages = %w(home)

  pages.each do |page|
    context "on GET page #{page}" do
      it 'responds with success' do
        get :show, id: page
        expect(response.status).to eq(200)
        expect(response).to render_template(page)
        expect(response).to render_template('application')
      end
    end
  end
end