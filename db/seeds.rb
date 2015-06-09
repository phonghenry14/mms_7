require 'factory_girl_rails'
Dir[Rails.root.join("db/factories/*.rb")].each {|f| require f}

FactoryGirl.create :user
FactoryGirl.create :user, name: "minh"
5.times do
  FactoryGirl.create :skill
end
