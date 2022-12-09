ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :email, :phone, :address_city, :address_line1, :address_line2, :address_country, :address_postal
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :phone, :address_city, :address_line1, :address_line2, :address_country, :address_postal]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  show do
    attributes_table do
      row :id
      row :name
      row :email
      row :phone
      row :address_city
      row :address_line1
      row :address_line2
      row :address_country
      row :address_postal
      row :created_at
      row :updated_at
    end
    panel "Customer Order History (Click the id for more details)" do
      table_for customer.orders do
        column :id do |order|
          link_to order.id, admin_order_path(order)
        end
        column :order_status do |order|
          order.order_status.name
        end
        column :payment_status
        column :amount_subtotal
        column :amount_tax
        column :amount_total
        column :order_details do |order|
          table_for order.order_details do
            column :quantity
            column :purchase_unit_price
            column :product do |product|
              link_to product.product.name, admin_product_path(product.product)
            end
          end
        end
      end
    end
  end
end
