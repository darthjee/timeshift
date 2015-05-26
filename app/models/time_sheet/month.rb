class TimeSheet::Month < ActiveRecord::Base
  belongs_to :sheet
  has_many :days

  validates :sheet, :year, :month, presence: true
end
