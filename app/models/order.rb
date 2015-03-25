class Order < ActiveRecord::Base
  validates_presence_of :quantity
  validates_numericality_of :quantity, greater_than: 0
  default_scope :order => 'created_at DESC'
  
  around_create :order_total

  belongs_to :book


  

  def order_total
    if self.client.blank?
      self.client="Anomino"
    end

    self.total = self.book.price * self.quantity
    yield
  end

  def set_with_lempiras
    "#{total} Lps"
  end

  def decorate_created_at
    created_at.strftime(" %d %b %Y %l:%M %p")
  end

  
end
