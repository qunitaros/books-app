FactoryBot.define do
  factory :cocktailcase do
    association :user
    association :cocktail
  end
end
