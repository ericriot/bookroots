class AuthorsController < ApplicationController
	
	# load_and_authorize_resource :except => :create

	before_action :set_author, only: [:show, :edit, :update, :destroy]
	
	def new
		@author = Author.new()
	end

	def index
		@author = Author.all().order('Name ASC')
	end

	def show
	end

	def edit
	end

	def destroy
		@author.destroy
		redirect_to authors_path
	end


	def create
	  
	  @author = Author.new(author_params)
	  authorize! :create, @author 

 
	  @author.save
	  redirect_to @author
	end


	# PATCH/PUT /examples/1
	# PATCH/PUT /examples/1.json
	def update
		respond_to do |format|
			if @author.update(author_params)
				format.html { redirect_to @author, notice: 'Author was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @author.errors, status: :unprocessable_entity }
			end
		end
	end


	

	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_author
	      @author = Author.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
    	def author_params
      		params.require(:author).permit(:name)
    	end


end
