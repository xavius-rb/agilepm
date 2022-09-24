FactoryBot.define do
  factory :project do
    name { Faker::App.name }

    factory :project_with_board do
      boards { [association(:board)] }
    end
  end
end
