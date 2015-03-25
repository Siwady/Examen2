class Author < ActiveRecord::Base
  validates_uniqueness_of :email, :name
  validates_presence_of :email ,allow_blank: false
  
  has_many  :books
    
  has_secure_password
end
