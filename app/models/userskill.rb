class Userskill < ActiveRecord::Base
  enum level: [:Beginner, :Amateur, :Professional, :ToCoder, :SuperStar, :Legendary]

  belongs_to :user
  belongs_to :skill
end
