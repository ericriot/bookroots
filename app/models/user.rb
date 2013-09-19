class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # need a way for admin users at some point, hacking my account to be admin for now
  def admin?
  	self.id == 1
  end
  
end
