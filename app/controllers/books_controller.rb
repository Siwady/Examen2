class BooksController < ApplicationController
  def index
    @book=Book.order(:title) 

    @book = Book.includes(:author).order(:title)
  
    if params[:keyword].present?
      q = params[:keyword]
      @book = @book.joins(:author)
        .where("books.title LIKE '%#{q}%' OR authors.name LIKE '%#{q}%' OR books.price LIKE '%#{q}%' OR books.description LIKE '%#{q}%' OR books.category LIKE '%#{q}%'")
    end

    if request.xhr?
      render partial: "table", locals: {books: @book}
    end
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
    @author = current_user
    @book = @author.books.find(params[:id])
  end

  def update
    @author = current_user
    @book = @author.books.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  def show
    @book=Book.find(params[:id])
    @orders=@book.orders
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to mybooks_author_path(current_user.id)
  end

  private

    def book_params
      params.require(:book).permit!
    end

end
