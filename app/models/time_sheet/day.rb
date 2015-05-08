class TimeSheet::Day < ActiveRecord::Base
  belongs_to :sheet
end
