require 'spec_helper'

describe TimeSheet::MonthsController do

  describe 'GET index' do
    let(:json_response) { JSON.parse(response.body) }
    let(:sheet_month) { time_sheet_months(:may_2015) }
    let(:year) { sheet_month.year }
    let(:month) { sheet_month.month }
    let(:sheet_id) { sheet_month.sheet.id }

    context 'when user is logged in' do
      include_context 'user is logged in'

      it 'renders month and its days' do
        get :index, { sheet_id: sheet_id, year: year, month: month, format: :json }
        expect(json_response['days']).to be_a(Array)
      end
    end
  end
end
