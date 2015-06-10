FactoryGirl.create :user, role: Settings.user.role.admin
FactoryGirl.create :user, name: "minh", role: Settings.user.role.admin
FactoryGirl.create :user, name: "phong2"
FactoryGirl.create :user, name: "minh2"
5.times do
  FactoryGirl.create :skill
end
