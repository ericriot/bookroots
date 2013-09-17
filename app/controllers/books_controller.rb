class BooksController < ApplicationController
	before_action :set_book, only: [:show, :edit, :update, :destroy]


	def new
		@book = Book.new()
	end

	def index
		@books = Book.all()
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
  	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy

		redirect_to books_path
	end


	def create
	  
	  @book = Book.new(params[:book].permit(:title, :author))
 
	  @book.save
	  redirect_to @book
	end

	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_book
	      @book = Book.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    #def example_params
	    #  params.require(:example).permit(:title, :text, :year)
	   # end


end
