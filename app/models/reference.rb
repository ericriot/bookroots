class Reference < ActiveRecord::Base
	
	# the site loses value without some description of the relationship
	validates :description, presence: true 

	# the book that makes the reference. gets the normal book_id foreign key
	belongs_to :book 
	
	# this represents the book_id_secondary in the references table
	belongs_to :referenced_book, :class_name => "Book", :foreign_key => "book_id_secondary"



	


end
