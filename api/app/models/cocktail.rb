class Cocktail < ApplicationRecord
  self.primary_key = "cocktail_id"
  has_many :posts, dependent: :destroy
  has_many :cocktailcases
  has_many :users, through: :cocktailcases

  validates :cocktail_id, presence: true
  validates :cocktail_name, presence: true
  validates :alcohol, presence: true
end
