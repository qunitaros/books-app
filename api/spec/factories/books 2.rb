FactoryBot.define do
  factory :book do
    sequence(:isbn) { |n| n }
    title { "タイトル" }
    author { "著者" }
    sequence(:url) { |n| "www.docker-compose/#{n}" }
    sequence(:image_url) { |n| "www.docker-compose/image/#{n}" }
  end
end
