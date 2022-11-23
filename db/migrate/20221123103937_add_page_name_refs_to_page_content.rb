class AddPageNameRefsToPageContent < ActiveRecord::Migration[7.0]
  def change
    add_reference :page_contents, :page_name, null: false, foreign_key: true
  end
end
