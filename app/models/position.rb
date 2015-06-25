class Position < ActiveRecord::Base
  include ActivityLogs
  extend CsvExports

  validates :name, presence: true
  validates :abbreviation, presence: true

  has_many :user_positions
  has_many :user, through: :user_positions

  after_create :log_create
  after_update :log_update
  after_destroy :log_destroy

end
