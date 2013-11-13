class PopulateBooksCounter < ActiveRecord::Migration
  def change

    # just fill in the book counts. should have done this on previous migration
    Author.reset_column_information
    Author.find(:all).each do |a|
      Author.update_counters a.id , :books_count => a.books.length
    end

  end
end
