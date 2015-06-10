FactoryGirl.define do
  factory :position do
    name {Faker::Name.name}
    abbreviation {Faker::Lorem.word}
  end
end
