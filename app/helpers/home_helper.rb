module HomeHelper
  def books
    Book.count
  end

  def authors
    Author.count
  end

end
