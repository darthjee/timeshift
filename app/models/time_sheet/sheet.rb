class TimeSheet::Sheet < ActiveRecord::Base
  belongs_to :user
  has_many :months

  validates :name, :user, presence: true
end
