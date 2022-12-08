ActiveAdmin.register OrderDetail do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :quantity, :purchase_unit_price, :order_id, :product_id
  filter :order_id, as: :select, collection: -> {Order.all.map{|o| ["#{o.id} - #{o.payment_intent}", o.id]}}
  #
  # or
  #
  # permit_params do
  #   permitted = [:quantity, :purchase_unit_price, :order_id, :product_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
