class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :payment_intent
      t.string :payment_status
      t.string :payment_method
      t.float :amount_total
      t.float :amount_subtotal
      t.integer :unix_timestamp
      t.string :purchase_address
      t.string :stripe_status
      t.string :order_status

      t.timestamps
    end
  end
end
