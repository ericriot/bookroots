class RenameBookIdPrimary < ActiveRecord::Migration
  def change
  	rename_column :references, :book_id_primary, :book_id
  end
end
