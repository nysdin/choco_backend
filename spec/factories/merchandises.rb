FactoryBot.define do
  factory :merchandise do
    sequence(:title) { |n| "Merchandise Title#{n}" }
    sequence(:description) { |n| "Merchandise Description#{n}" }
    price { rand(0..100000) }
    association :seller, factory: :user

    trait :with_buyer do
      association :buyer, factory: :user
    end
  end
end
