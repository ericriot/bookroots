class AddUserIdColumns < ActiveRecord::Migration
  def change
  	add_column :books, :user_id, :integer;
  	add_column :authors, :user_id, :integer;
  	add_column :references, :user_id, :integer;
  end
end
