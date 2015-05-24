class TimeSheet::Sheet < ActiveRecord::Base
  belongs_to :user
  has_many :days

  validates :name, :user, presence: true
end
