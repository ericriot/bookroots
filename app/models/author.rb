class Author < ActiveRecord::Base

	# this list is only in drop downs for now, make it sorted throughout
	default_scope { order(' name ASC ') }	

	validates :name, presence: true, uniqueness: true


	has_many :books

	# user that added author to database
	belongs_to :user 
	

end
