FactoryBot.define do
  factory :course do
    name { Faker::Lorem.word }
    created_by { Faker::Number.number(10) }
    # association :user
    factory :course_with_users do
      transient do
        users_count 10
      end

      after(:create) do |user, evaluator|
        create_list(:users, evaluator.users_count, user: user)
      end
    end

    factory :course_with_cohorts do
      transient do
        cohorts_count 10
      end

      after(:create) do |cohort, evaluator|
        create_list(:cohorts, evaluator.cohorts_count, cohort_id: cohort)
      end
    end
  end
end
