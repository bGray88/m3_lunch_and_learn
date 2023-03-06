class AddForeignKeyToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :favorites, :users, column: :api_key, primary_key: :api_key
  end
end
