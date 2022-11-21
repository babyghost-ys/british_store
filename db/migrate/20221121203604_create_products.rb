class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.text :description
      t.float :current_price
      t.string :status

      t.timestamps
    end
  end
end
