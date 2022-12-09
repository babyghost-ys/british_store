ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :customer_id,:order_status_id,:payment_intent, :payment_status, :payment_method, :amount_total, :amount_subtotal, :unix_timestamp, :stripe_status, :order_status, :customer_id, :amount_tax, :purchase_address_city, :purchase_address_line1, :purchase_address_line2, :purchase_address_country, :purchase_address_postal
  #
  # or
  #
  # permit_params do
  #   permitted = [:payment_intent, :payment_status, :payment_method, :amount_total, :amount_subtotal, :unix_timestamp, :stripe_status, :order_status, :customer_id, :amount_tax, :purchase_address_city, :purchase_address_line1, :purchase_address_line2, :purchase_address_country, :purchase_address_postal]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  show do
    attributes_table do
      row :id
      row :order_status
      row :payment_intent
      row :payment_status
      row :payment_method
      row :amount_subtotal
      row :amount_tax
      row :amount_total
      row :unix_timestamp
      row :stripe_status
      row :customer do |customer|
        link_to customer.customer.name, admin_customer_path(customer.customer)
      end
      row :purchase_address_city
      row :purchase_address_line1
      row :purchase_address_line2
      row :purchase_address_country
      row :purchase_address_postal
      row :created_at
      row :updated_at
    end
    panel "Order Details" do
      table_for order.order_details do
        column :quantity
        column :purchase_unit_price
        column :product do |product|
          link_to product.product.name, admin_product_path(product.product)
        end
        column :created_at
        column :updated_at
      end
    end
  end
end
