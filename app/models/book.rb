class Book < ActiveRecord::Base
  validates_presence_of :title, :description, :price
  validates_numericality_of :price, greater_than: 0
  validates :description, length: { maximum: 200 }


  belongs_to :author
  has_many  :orders

  def self.categories_to_select
    ["AVENTURA", "ROMANCE","INFANTIL","EDUCATIVO","MOTIVACIONAL"]
  end

  def set_with_lempiras
    "#{price} Lps"
  end

  def  total_money(book)
    @total = Order.where("book_id = #{book.id}")
    @total.sum(:total)
  end
end
