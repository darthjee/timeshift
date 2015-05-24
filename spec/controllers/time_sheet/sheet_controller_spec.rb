require 'spec_helper'

describe TimeSheet::SheetController do

  describe "GET show" do
    xit "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET create" do
    xit "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
