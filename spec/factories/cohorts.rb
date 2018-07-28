FactoryBot.define do
  factory :cohort do
    name { Faker::StarWars.character }
    start_date { Faker::Date.backward(7*12) }
    end_date { Faker::Date.forward(1) }
    course_id nil
    # association :user

  end
end
