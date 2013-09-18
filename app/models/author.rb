class Author < ActiveRecord::Base

	# this list is only in drop downs for now, make it sorted throughout
	default_scope order(' name ASC ');	

	validates :name, presence:true;

	has_many :books

	belongs_to :user # user that added author to database
	

end
