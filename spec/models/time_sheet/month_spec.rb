require 'spec_helper'

describe TimeSheet::Month do
  describe :validations do
    let(:object) { time_sheet_months(:may_2015) }

    it_behaves_like 'object that has mandatory attributes', :sheet, :year, :month
  end
end
