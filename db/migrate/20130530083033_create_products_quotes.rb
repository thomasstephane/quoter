class CreateProductsQuotes < ActiveRecord::Migration
  def change
    create_table :products_quotes do |t|
      t.string :comment
      t.integer :product_id, :quote_id, :quantity
      t.float :discount, :price
      t.timestamps
    end
  end
end
