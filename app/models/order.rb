class Order < ApplicationRecord

  has_many :order_details
 #  belongs_to :item, through => :order_details
  belongs_to :customer

  enum order_status: {"入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済":4}
  enum payment_type: { credit_card: 0, transfer: 1 }
end
