FactoryGirl.define do
  factory :project do
    name {Faker::Name.name}
    abb {Faker::Lorem.word}
    team_id {Faker::Number.digit}
    start_date {Faker::Date.backward(140)}
    end_date {Faker::Date.backward(140)}
  end
end
