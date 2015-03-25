class AuthorMailer < ActionMailer::Base
  default from: "Biblioteca@Libros.com"

  def welcome_email(author)
    @author = author
    mail(to: @author.email, subject: "Bienvenidos a mi Biblioteca")
  end
end
