class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :normal, ->{where role: Settings.user.role.normal}
  scope :no_team, ->{where team_id: nil}

  validates :name, presence: true, uniqueness: true, length: {maximum: Settings.user.name.maximum}
  validates :email, presence: true, length: {maximum: Settings.user.email.maximum}

  has_many :userskills
  has_many :skills, through: :userskills
  has_many :user_positions
  has_many :positions, through: :user_positions

  accepts_nested_attributes_for :userskills, allow_destroy: true
  accepts_nested_attributes_for :user_positions, allow_destroy: true

  def is_admin?
    role == Settings.user.role.admin
  end
end
