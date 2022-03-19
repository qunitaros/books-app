FactoryBot.define do
  factory :post do
    association :user
    association :book
    association :cocktail
    content { "sample" }
  end
end
