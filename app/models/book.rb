class Book < ActiveRecord::Base
  validates_presence_of :title, :description, :price
  validates_numericality_of :price, greater_than: 0
  validates :description, length: { maximum: 200 }


  belongs_to :author
  has_many  :orders
end
