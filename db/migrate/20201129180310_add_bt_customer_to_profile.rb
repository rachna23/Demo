class AddBtCustomerToProfile < ActiveRecord::Migration[6.0]
  def change
  	 	add_column :profiles, :braintree_customer_id, :integer
  end
end
