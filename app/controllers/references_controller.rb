class ReferencesController < ApplicationController
	load_and_authorize_resource :except => :create

	def new
	  @book = Book.friendly.find(params[:book_id]) 
	  @reference = Reference.new(:book_id => params[:book_id])

	  # poulate the drop down. not scalable 
	  @books = Book.where(' id <> ' + @book.id.to_s ).order(' title ASC ')


	end

	def create
	  
	  
	  @book = Book.friendly.find(params[:book_id]) 
	  
	  @reference = Reference.new(reference_params)
 	  @reference.user_id = current_user.id
 	  @reference.book_id = @book.id
	  	
	  authorize! :create, @reference 

	  if @reference.save
	  	redirect_to @book
	  else
	  	@books = Book.where(' id <> ' + @book.id.to_s ).order(' title ASC ')
	  	render :new
	  end

	end


	def destroy
		@reference = Book.friendly.find(params[:id])
		@reference.destroy

		redirect_to @reference.book
	end

	private
		# Never trust parameters from the scary internet, only allow the white list through.
    	def reference_params
      		params.require(:reference).permit(:description, :book_id, :book_id_secondary)
      	end
end
