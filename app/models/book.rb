class Book < ActiveRecord::Base
	
	# this version 5 isn't released yet. joy.
	extend FriendlyId
	friendly_id :title, use: :slugged
	
	def should_generate_new_friendly_id?
		# true
		new_record?
	end
	

	default_scope { order(' title ASC ') }	


	# this is the connection to the linking table, and then one more to the books	
	has_many :references 
	has_many :referenced_books, :through => :references

	# This is basically the inverse, use book_id_secondary instead
	has_many :branches, :class_name => 'Reference', :foreign_key => 'book_id_secondary'
	has_many :branched_books, :through => :branches

	# This is the add to shelf / list functionality
	has_many :favorites, :class_name => 'Favorite'
	
	# has_many :favorite_users, :through => :booklists


	validates :title, presence: true, uniqueness: true
	validates :author, presence: true
	validates :published, numericality: :only_integer
	
	belongs_to :author, touch: true
	belongs_to :user # user that added book to database
	


	
end
