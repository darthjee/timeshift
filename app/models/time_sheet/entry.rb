class TimeSheet::Entry < ActiveRecord::Base
  belongs_to :day
end
