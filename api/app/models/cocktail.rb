class Cocktail < ApplicationRecord
  self.primary_key = "cocktail_id"
  has_many :posts, dependent: :destroy
end
