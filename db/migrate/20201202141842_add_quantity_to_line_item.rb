class AddQuantityToLineItem < ActiveRecord::Migration[6.0]
  def change
  	add_column :line_items, :product_id, :integer
  	add_column :line_items, :quantity, :integer
  end
end
