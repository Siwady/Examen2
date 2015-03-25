class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user#, :metodo1, :metodo2


  def current_user
    if session[:author_id].present?
      @current_user = Author.find(session[:author_id])
    end
  end

  def login(author)
    session[:author_id] = author.id
    redirect_to root_path
  end

  def authenticate
    unless current_user.present?
      redirect_to login_path
    end
  end

end
