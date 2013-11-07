class FavoritesController < ApplicationController
	
	load_and_authorize_resource :except => :create

	def create
	  
	  
	  @book = Book.friendly.find(params[:book_id]) 
	  
	  @favorite = Favorite.new()

	  @favorite.book_id = @book.id
 	  @favorite.user_id = current_user.id
 	 	
 	 	# @favorite.user_id = nil #test the error message

	  authorize! :create, @favorite 

	  if @favorite.save
	  	flash[:alert] = 'Added successfully'
	  	redirect_to @book
	  else
	  	flash[:alert] = 'There was a problem with your request'
	  	redirect_to @book
	  end

	end


	def destroy
		@favorite = Book.friendly.find(params[:id])
		@favorite.destroy

		redirect_to @favorite.book
	end

	private
		# Never trust parameters from the scary internet, only allow the white list through.
    # This isn't working, having trouble posting directly to a nested resource.

end
