#Add default to line
class AddDefaultToLineItem < ActiveRecord::Migration[6.0]
  def change
  	add_column :line_items, :quantity, :integer, :null => false, :default => 1
  end
end
