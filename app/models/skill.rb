class Skill < ActiveRecord::Base
  validates :name, presence: true
  has_many :user_skills
  has_many :users, through: :user_skills
end
