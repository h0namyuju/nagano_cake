class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_details
  has_many :customers, :through => :cart_items
  has_many :orders, :through => :order_details

  belongs_to :genre
end
