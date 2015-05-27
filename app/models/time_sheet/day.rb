class TimeSheet::Day < ActiveRecord::Base
  belongs_to :month

  validates :month, :day, presence: true
end
