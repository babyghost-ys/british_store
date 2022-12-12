ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :current_price, :category_id, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:sku, :name, :description, :current_price, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : content_tag(:span, "no images yet")
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  show do
    panel "Product Details" do
      attributes_table_for product do
        row :name
        row :description
        row :current_price
        row :category
        row :created_at
        row :updated_at
        row :image do
          if product.image.attached?
            image_tag(product.image, size: "300x300")
          end
        end
      end
    end
  end

  controller do
    def destroy
      product = Product.find(params[:id])
      product.category.products.delete(product)
      product.destroy
      redirect_to admin_products_path, notice: "Product deleted"
    end
  end
end
