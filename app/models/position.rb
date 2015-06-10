class Position < ActiveRecord::Base
  validates :name, presence: true
  validates :abbreviation, presence: true
end
