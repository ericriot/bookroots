class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :book_id
      t.integer :user_id
      t.string :details

      t.timestamps
    end
  end
end
