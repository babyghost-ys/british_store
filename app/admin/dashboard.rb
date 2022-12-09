# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Recent Orders" do
          table_for Order.order("id desc").limit(50) do
            column :id do |order|
              link_to order.id, admin_order_path(order)
            end
            column :amount_subtotal
            column :amount_tax
            column :amount_total
            column :customer do |customer|
              link_to customer.customer.name, admin_customer_path(customer.customer)
            end
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
          strong { link_to "View All Orders", admin_orders_path }
        end
      end
    end
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
