class BooksController < ApplicationController
	load_and_authorize_resource :except => :create

	before_action :set_book, only: [:show, :edit, :update, :destroy]
	
	
	def new
		@book = Book.new()
		@authors = Author.all()
	end

	def index
		Book.all( :include => [ :author, :references, :branches])


	end

	def show
	end

	def edit
		# load this for the drop down box. Is this right? i'm going to lose that box soon anyways
		@authors = Author.all()
  	end

	def destroy
		@book.destroy
		redirect_to books_path
	end


	def create
	  
	  @book = Book.new(book_params)
	  authorize! :create, @book 

 
	  @book.save
	  redirect_to @book
	end


	# PATCH/PUT /examples/1
	# PATCH/PUT /examples/1.json
	def update
		respond_to do |format|
			if @book.update(book_params)
				format.html { redirect_to @book, notice: 'Book was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @book.errors, status: :unprocessable_entity }
			end
		end
	end


	

	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_book
	      @book = Book.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
    	def book_params
      		params.require(:book).permit(:title, :author_id, :published, :image, :amazon_url)
    	end


end
