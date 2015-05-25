class TimeSheet::Day < ActiveRecord::Base
  belongs_to :month

  validates :month, :date, presence: true
end
