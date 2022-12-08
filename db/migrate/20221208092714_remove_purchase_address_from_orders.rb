class RemovePurchaseAddressFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :purchase_address, :string
  end
end
