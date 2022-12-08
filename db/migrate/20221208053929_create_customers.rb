class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address_city
      t.string :address_line1
      t.string :address_line2
      t.string :address_country
      t.string :address_postal

      t.timestamps
    end
  end
end
