class BooksController < ApplicationController
	# before_action :current_user, only: [:edit]
 before_action :authenticate_user!


	def new
		@book = Book.new
	end

	def create
		book = Book.new(book_params)
		book.user_id = current_user.id
		if book.save
			flash[:notice] = "successfully"
			redirect_to book_path(book.id)
		else
			@book = book
			@books = Book.all
			@user  = current_user
			flash[:notice] ="error"
			render :index
		end
	end

	def show
		@book = Book.find(params[:id])
		@user = User.find(@book.user_id)
	end

	def index
		@book = Book.new
		@books = Book.all
		@user  = current_user
	end

	def edit
		@book = Book.find(params[:id])
		if current_user != @book.user
    	redirect_to books_path
        end
	end

	def update
		book = Book.find(params[:id])
		if current_user != book.user
    	redirect_to user_path(current_user)
        end
			if book.update(book_params)
				redirect_to book_path(book.id)
				flash[:notice] = "successfully"
			else
				@book= book
				flash[:notice] = "error"
				render :edit
		    end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private

	def book_params
		params.require(:book).permit(:title, :opinion)
	end


end
