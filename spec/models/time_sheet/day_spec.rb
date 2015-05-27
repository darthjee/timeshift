require 'spec_helper'

describe TimeSheet::Day do
  describe :validations do
    let(:object) { time_sheet_days(:first) }

    it_behaves_like 'object that has mandatory attributes', :month, :day
  end
end
