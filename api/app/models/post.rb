class Post < ApplicationRecord
  belongs_to :user
  belongs_to :book, primary_key: "isbn"
  belongs_to :cocktail, primary_key: "cocktail_id"

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
end
