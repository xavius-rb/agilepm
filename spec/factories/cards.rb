FactoryBot.define do
  factory :card do
    project
    summary { Faker::Lorem.sentence }
    state { "to_do" }
  end
end
