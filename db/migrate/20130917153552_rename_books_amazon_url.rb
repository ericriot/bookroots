class RenameBooksAmazonUrl < ActiveRecord::Migration
  def change
  	rename_column :books, :amazonUrl, :amazon_url
  end
end
