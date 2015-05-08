class TimeSheet::Entry < ActiveRecord::Base
  belongs_to :day

  validates :day, :flow, :time, presence: true
end
