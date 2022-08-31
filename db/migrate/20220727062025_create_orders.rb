class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :total_amount
      t.integer :order_status, null: false, default:0
      t.integer :payment_type, default:0
      t.integer :shipping_fee
      t.integer :customer_id


      t.timestamps
    end
  end
end
