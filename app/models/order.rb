class Order < ActiveRecord::Base
  validates_presence_of :quantity
  validates_numericality_of :quantity, greater_than: 0
  
  belongs_to :book
end
