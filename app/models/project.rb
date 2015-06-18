class Project < ActiveRecord::Base
  belongs_to :team

  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
end
