class Project < ActiveRecord::Base
  include ActivityLogs

  belongs_to :team

  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects

  def to_csv
    CSV.generate do |csv|
      data = [self.id] + [self.name] + [self.abb] +[self.start_date]
        + [self.end_date]
      team = User.find_by_id(self.team_id).name
      users = self.users.map(&:name)
      csv << ["id", "name", "abb", "start_date", "end_date"]
      csv << data
      csv << ["team"]
      csv << leader
      csv << ["users"]
      csv << users
    end
  end
end
