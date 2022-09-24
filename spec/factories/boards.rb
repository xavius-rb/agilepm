FactoryBot.define do
  factory :board do
    project
    title { Faker::Team.name }
  end
end
