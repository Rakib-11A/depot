class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  enum :pay_type,
       check: 1,
       credit_card: 2,
       purchase_order: 3


  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: { in: pay_types.keys }

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end
