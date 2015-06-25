FactoryGirl.define do
  factory :userskill do
    level {Faker::Name.name}
    year {Faker::Lorem.word}
    user_id {Faker::Number.digit}
    skill_id {Faker::Number.digit}
  end
end
