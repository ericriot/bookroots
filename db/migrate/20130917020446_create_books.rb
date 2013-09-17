class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :published
      t.text :synopsis
      t.string :image
      t.string :amazonUrl

      t.timestamps
    end
  end
end
