class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :book
      t.references :cocktail

      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
    add_foreign_key :posts, :books, column: :book_id , primary_key: :isbn
    add_foreign_key :posts, :cocktails, column: :cocktail_id , primary_key: :cocktail_id
  end
end
