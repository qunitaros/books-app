class CreateCocktails < ActiveRecord::Migration[6.1]
  def change
    create_table :cocktails, id: false do |t|
      t.bigint :cocktail_id, null: false, primary_key: true
      t.string :cocktail_name
      t.string :base_name
      t.string :technique_name
      t.string :taste_name
      t.string :style_name
      t.integer :alcohol
      t.string :top_name
      t.string :glass_name
      t.string :type_name
      t.string :cocktail_digest
      t.string :cocktail_desc
      t.string :recipe_desc

      t.timestamps
    end
  end
end
