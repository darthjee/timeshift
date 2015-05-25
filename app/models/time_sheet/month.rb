class TimeSheet::Month < ActiveRecord::Base
  belongs_to :sheet

  validates :sheet, :year, :month, presence: true
end
