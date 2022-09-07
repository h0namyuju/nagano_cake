class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

       t.integer :amount
       t.integer :price
       t.integer :production_status
       t.integer :item_id
       t.integer :order_id



      t.timestamps
    end
  end
end
