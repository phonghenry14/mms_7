FactoryGirl.define do
  factory :team do
    name {Faker::Name.name}
    description {Faker::Lorem.sentence}
    leader_id {Faker::Number.digit}
  end
end
