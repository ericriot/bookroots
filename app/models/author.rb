class Author < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  # dont change the slug when the title changes. I may change this later.
  def should_generate_new_friendly_id?
    new_record? || true
  end
  
	# this list is only in drop downs for now, make it sorted throughout
	default_scope { order(' name ASC ') }	

	validates :name, presence: true, uniqueness: true


	has_many :books

	# user that added author to database
	belongs_to :user 
	

end
