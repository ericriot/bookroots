class AddColumnsToReferences < ActiveRecord::Migration
  def change
  	add_column :references, :book_id_primary, :integer
  	add_column :references, :book_id_secondary, :integer
  	add_column :references, :description, :text
  end

end
