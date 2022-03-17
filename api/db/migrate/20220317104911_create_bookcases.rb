class CreateBookcases < ActiveRecord::Migration[6.1]
  def change
    create_table :bookcases do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false

      t.timestamps
    end
    add_foreign_key :bookcases, :books, column: :book_id , primary_key: :isbn
  end
end
