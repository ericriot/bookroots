class ReferencesController < ApplicationController

	def new
	  @book = Book.find(params[:book_id]) 
	  @reference = Reference.new(:book_id => params[:book_id])

	  # poulate the drop down. not scalable 
	  @books = Book.all()

	end

	def create
	  
	  
	  @book = Book.find(params[:book_id]) 
	  
	  @reference = Reference.new(reference_params)
 	  @reference.user_id = current_user.id
 	  @reference.book_id = @book.id
	  @reference.save

	  redirect_to @book

	end


	def destroy
		@reference = Book.find(params[:id])
		@reference.destroy

		redirect_to @reference.book
	end

	private
		# Never trust parameters from the scary internet, only allow the white list through.
    	def reference_params
      		params.require(:reference).permit(:description, :book_id, :book_id_secondary)
      	end
end
