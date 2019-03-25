class BooksController < ApplicationController

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
  	flash[:notice] ="error"
  	redirect_to books_path
  end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
  	@book = Book.new
  	@books = Book.all
  	@user  = current_user
  end

  def edit
  	@book = Book.find(params[:id])
  end

  private
   
    def book_params
        params.require(:book).permit(:title, :opinion)
    end
end
