class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # need a way for admin users at some point, hacking my account to be admin for now
  def admin?
  	self.id == 1
  end

  # a user has books through the booklist
  has_many :favorites
  has_many :favorite_books, :through => :favorites

  def likes_book? book_id
    Favorite.where(" user_id = #{self.id} AND book_id = #{book_id}").any?
    # self.favorites.find_by(:book_id: @book_id)
  end
  
end
