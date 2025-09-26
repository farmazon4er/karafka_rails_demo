class Product < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true
  validates :price, presence: true
  validates :inventory, presence: true, numericality: { greater_than_or_equal_to: 0 }
  def inspect
    "#<Product id: #{id}, name: #{name}, code: #{code}, price: #{formatted_price}, inventory: #{inventory}>"
  end
  def formatted_price
    format("%.2f", price)
  end
end
