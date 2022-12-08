class AddColumnsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :amount_tax, :float
    add_column :orders, :purchase_address_city, :string
    add_column :orders, :purchase_address_line1, :string
    add_column :orders, :purchase_address_line2, :string
    add_column :orders, :purchase_address_country, :string
    add_column :orders, :purchase_address_postal, :string
  end
end
