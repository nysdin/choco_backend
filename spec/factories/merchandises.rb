FactoryBot.define do
  factory :merchandise do
    sequence(:title) { |n| "Merchandise Title#{n}" }
    sequence(:description) { |n| "Merchandise Description#{n}" }
    price { rand(0..100_000) }
    condition { rand(1..6) }
    public_status { 0 }

    association :seller, factory: :user
    trait :with_buyer do
      association :buyer, factory: :user
    end

  end
end
