FactoryBot.define do
  factory :divided_department do
    department_id { rand(1..18) }
    association :merchandise
  end
end
