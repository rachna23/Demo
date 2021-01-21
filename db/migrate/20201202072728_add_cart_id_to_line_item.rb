#Add cart id
class AddCartIdToLineItem < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :cart_id, :integer
  end
end
