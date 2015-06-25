10.times do
  FactoryGirl.create :user
  FactoryGirl.create :team
  FactoryGirl.create :project
  FactoryGirl.create :skill
  FactoryGirl.create :position
  FactoryGirl.create :userskill
  FactoryGirl.create :user_position
end
FactoryGirl.create :user, name: "phong", email: "phong1@gmail.com",
                          role: Settings.user.role.admin
FactoryGirl.create :user, name: "minh", email: "minh1@gmail.com",
                          role: Settings.user.role.admin
FactoryGirl.create :user, name: "phong2", email: "phong23@gmail.com"

