class Skill < ActiveRecord::Base
  include ActivityLogs
  extend CsvExports

  has_many :userskills, dependent: :destroy
  has_many :users, through: :userskills

  validates :name, presence: true

  after_create :log_create
  after_update :log_update
  after_destroy :log_destroy

end
