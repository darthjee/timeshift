require 'spec_helper'

describe TimeSheet::Entry do
  describe :validations do
    let(:object) { time_sheet_entries(:first) }

    it_behaves_like 'object that has mandatory attributes', :day, :time, :flow
  end
end
