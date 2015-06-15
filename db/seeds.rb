
FactoryGirl.create :user, role: Settings.user.role.admin
FactoryGirl.create :user, name: "minh", role: Settings.user.role.admin
FactoryGirl.create :user, name: "phong2"
FactoryGirl.create :user, name: "minh2"
FactoryGirl.create :team
FactoryGirl.create :team, name: "Bao loan"
FactoryGirl.create :project
10.times do
  FactoryGirl.create :skill
  FactoryGirl.create :position
end
