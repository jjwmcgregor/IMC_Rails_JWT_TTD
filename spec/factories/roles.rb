FactoryBot.define do
  factory :role do
    roles { Faker::Lorem.word }
    # association :user
    # factory :role_with_users do
    #   transient do
    #     users_count 10
    #   end
    #
    #   after(:create) do |user, evaluator|
    #     create_list(:users, evaluator.users_count, user: user)
    #   end
    # end
  end
end
