class Book < ApplicationRecord
  self.primary_key = "isbn"
  has_many :posts
  has_many :bookcases
  has_many :users, through: :bookcases

  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true
end
