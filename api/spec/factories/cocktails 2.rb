FactoryBot.define do
  factory :cocktail do
    sequence(:cocktail_id) { |n| n }
    cocktail_name { "カクテルネーム" }
    base_name { "ベースネーム" }
    technique_name { "作り方" }
    taste_name { "味の名前" }
    style_name { "スタイルネーム" }
    alcohol { 99 }
    top_name { "トップネーム" }
    glass_name { "グラスの名前" }
    type_name { "タイプの名前" }
    cocktail_digest { "概要" }
    cocktail_desc { "これまた概要" }
    recipe_desc { "レシピの概要" }
  end
end
