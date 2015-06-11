class Position < ActiveRecord::Base
  validates :name, presence: true
  validates :abbreviation, presence: true

  has_many :user_positions
  has_many :user, through: :user_positions
end
