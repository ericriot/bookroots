class Reference < ActiveRecord::Base
	
	# the site loses value without some description of the relationship
	validates :description, presence: true 
	validates :user_id, presence:true 
	validates :book_id_secondary, presence:true
	validates :book_id, presence:true



	# the book that makes the reference. gets the normal book_id foreign key
	belongs_to :book 
	
	# this represents the book_id_secondary in the references table
	# this was tough! straightforward but a weird reference to learn with
	belongs_to :referenced_book, :class_name => "Book", :foreign_key => "book_id_secondary"

	# this is the inverse of above
	belongs_to :branched_book, :class_name => "Book", :foreign_key => "book_id"



	# this is the user that created the reference. I'll store it but not sure what i'll do with it
	belongs_to :user


	


end
