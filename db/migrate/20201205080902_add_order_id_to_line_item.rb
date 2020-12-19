class AddOrderIdToLineItem < ActiveRecord::Migration[6.0]
  def change
  	add_column :line_items, :order_id, :integer
  end
end
