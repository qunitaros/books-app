FactoryBot.define do
  factory :comment do
    association :user
    association :post
    comment { "コメントです" }
  end
end
