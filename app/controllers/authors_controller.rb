class AuthorsController < ApplicationController

  def new
    if current_user.present?
      redirect_to authors_path
    else
      @authors = Author.new
    end
  end

  def create
    @authors = Author.new(authors_params)

    if @authors.save
      #authorMailer.welcome_email(@author).deliver
      login(@authors)
    else
      render :new
    end
  end

  def mybooks
    @books=Book.where(author_id: params[:id])
  end

  def authors_params
      params.require(:author).permit!
  end

end
