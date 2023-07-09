FactoryBot.define do
  factory :task do
    description { Faker::Lorem.sentence }
    user
  end
end
