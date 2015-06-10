FactoryGirl.define do
  factory :user do
    name "phong"
    sequence :email do |n|
      "#{name}#{n}@gmail.com"
    end
    birthday {Faker::Date.backward(140)}
    password "12345678"
    password_confirmation "12345678"
    role Settings.user.role.normal
  end
end
