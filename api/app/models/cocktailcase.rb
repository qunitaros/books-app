class Cocktailcase < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail

  validates :user_id, presence: true
  validates :cocktail_id, presence: true
end
