class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birthday, :date, after: :email
    add_column :users, :profile, :string, limit: 1000, after: :birthday

    remove_column :users, :nickname, :string
  end
end
