class AddAuthorIdToBooks < ActiveRecord::Migration
  def change
  	remove_column :books, :author
  	add_column :books, :author_id, :integer
  	add_index :books, :author_id
  end
end
