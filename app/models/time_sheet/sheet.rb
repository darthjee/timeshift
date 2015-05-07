class TimeSheet::Sheet < ActiveRecord::Base
  belongs_to :user
end