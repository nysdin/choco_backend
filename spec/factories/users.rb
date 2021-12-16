FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test user#{n}" }
    sequence(:email) { |n| "test#{n}@google.com" }
  end

  trait :with_selling_merchandises do

    transient do
      selling_merchandise_count { 3 }
    end

    after(:create) do |user, evaluate|
      create_list(:merchandise, evaluate.selling_merchandise_count, seller: user)
    end
  end
end
