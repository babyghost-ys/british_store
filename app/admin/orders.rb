ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  menu false
  permit_params :order_status_id,:payment_intent, :payment_status, :payment_method, :amount_total, :amount_subtotal, :unix_timestamp, :stripe_status, :order_status, :customer_id, :amount_tax, :purchase_address_city, :purchase_address_line1, :purchase_address_line2, :purchase_address_country, :purchase_address_postal
  #
  # or
  #
  # permit_params do
  #   permitted = [:payment_intent, :payment_status, :payment_method, :amount_total, :amount_subtotal, :unix_timestamp, :stripe_status, :order_status, :customer_id, :amount_tax, :purchase_address_city, :purchase_address_line1, :purchase_address_line2, :purchase_address_country, :purchase_address_postal]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
