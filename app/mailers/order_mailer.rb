class OrderMailer < ActionMailer::Base
  default from: "Biblioteca@Libros.com"

  def new_order(book,order)
    @book = book
    @order=order
    mail(to: @book.author.email, subject: "Nueva Orden")
  end
end