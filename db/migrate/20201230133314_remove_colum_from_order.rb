class RemoveColumFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :name
    remove_column :orders, :email
    remove_column :orders, :address
    remove_column :orders, :billing_address_id
    remove_column :orders, :shipping_address_id
  end
end
