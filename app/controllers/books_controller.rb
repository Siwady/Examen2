class BooksController < ApplicationController
  def index
    @book=Book.order(:title) 
  end

  def new
    @author = current_user
    @book = Book.new
  end

  def create
    @author = current_user

    @book = @author.books.build(book_params)

    if @book.save
      redirect_to mybooks_author_path(current_user.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
    @author =current_user
    @book = @author.books.find(params[:id])

    @book.destroy
    redirect_to @author, flash: {notice: "Libro Eliminado!"}
  end

  private

    def book_params
      params.require(:book).permit!
    end

end
