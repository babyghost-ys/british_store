class CreatePageContents < ActiveRecord::Migration[7.0]
  def change
    create_table :page_contents do |t|
      t.text :header
      t.text :content

      t.timestamps
    end
  end
end
