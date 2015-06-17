class User < ActiveRecord::Base
  include ActivityLogs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :userskills, dependent: :destroy
  has_many :skills, through: :userskills
  has_many :user_positions, dependent: :destroy
  has_many :positions, through: :user_positions

  accepts_nested_attributes_for :userskills, allow_destroy: true
  accepts_nested_attributes_for :user_positions, allow_destroy: true

  validates :name, presence: true, uniqueness: true, length: {maximum: Settings.user.name.maximum}
  validates :email, presence: true, length: {maximum: Settings.user.email.maximum}

  after_create :log_create
  after_update :log_update
  after_destroy :log_destroy

  scope :normal, ->{where role: Settings.user.role.normal}
  scope :no_team, ->{where team_id: nil}

  def is_admin?
    role == Settings.user.role.admin
  end

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
