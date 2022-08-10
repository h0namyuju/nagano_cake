class Order < ApplicationRecord

  has_many :order_details
#  has_many :itetms, through => :order_details

  belongs_to :customer
end
