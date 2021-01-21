#Remove price
class RemovePriceFromProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :price
  end
end
