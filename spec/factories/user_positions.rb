FactoryGirl.define do
  factory :user_position do
    user_id {Faker::Number.digit}
    position_id {Faker::Number.digit}
  end
end
