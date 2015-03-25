module HomeHelper
  def get_books
    Book.count
  end

  def authors
    Author.count
  end

end
