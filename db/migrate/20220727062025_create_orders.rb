class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :total_amount
      t.integer :order_status


      t.timestamps
    end
  end
end
