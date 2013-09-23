class Book < ActiveRecord::Base
	
	# this isnt working in rails 4 yet. darn.
	# extend FriendlyId
	# friendly_id :title, use: [ :slugged ]
	# def should_generate_new_friendly_id?
	# 	new_record?
	# end

	default_scope { order(' title ASC ') }	


	# this is the connection to the linking table, and then one more to the books	
	has_many :references 
	has_many :referenced_books, :through => :references

	# This is basically the inverse, use book_id_secondary instead
	has_many :branches, :class_name => 'Reference', :foreign_key => 'book_id_secondary'
	has_many :branched_books, :through => :branches


	validates :title, presence: true, uniqueness: true
	validates :author, presence: true
	belongs_to :author
	
	belongs_to :user # user that added book to database
	


	
end
