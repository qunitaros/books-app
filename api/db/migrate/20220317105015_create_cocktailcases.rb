class CreateCocktailcases < ActiveRecord::Migration[6.1]
  def change
    create_table :cocktailcases do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cocktail, null: false

      t.timestamps
    end
    add_foreign_key :cocktailcases, :cocktails, column: :cocktail_id , primary_key: :cocktail_id
  end
end
