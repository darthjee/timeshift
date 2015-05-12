class TimeSheet::Day < ActiveRecord::Base
  belongs_to :sheet

  validates :sheet, :date, presence: true
end
