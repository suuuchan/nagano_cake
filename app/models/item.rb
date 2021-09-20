class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  attachment :image
  # validates :name, presense: true
  # validates :image, presense: true
  # validates :introduction, presense: true
  # validates :price, presense: true
  def with_tax_price
    (price*1.1).floor
  end
end
