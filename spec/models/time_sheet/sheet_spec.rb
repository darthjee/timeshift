require 'spec_helper'

describe TimeSheet::Sheet do
  describe :validations do
    let(:object) { time_sheet_sheets(:first) }

    it_behaves_like 'object that has mandatory attributes', :name, :user
  end
end
