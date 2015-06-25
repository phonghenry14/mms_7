FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    birthday {Faker::Date.backward(140)}
    password Settings.user.password
    password_confirmation Settings.user.password
    role Settings.user.role.normal
  end
end
