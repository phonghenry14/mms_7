class Team < ActiveRecord::Base
  include ActivityLogs

  has_many :users, dependent: :destroy
  has_many :projects, dependent: :destroy 
  
  accepts_nested_attributes_for :users, allow_destroy: :true
  accepts_nested_attributes_for :projects, allow_destroy: true 

  after_create :log_create
  after_update :log_update
  after_destroy :log_destroy

  private
  def log_create
    create_activity_log Settings.activities.create, self.class.name
  end

  def log_update
    create_activity_log Settings.activities.update, self.class.name
  end

  def log_destroy
    create_activity_log Settings.activities.destroy, self.class.name
  end
end

