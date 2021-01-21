#Add braintree address
class AddBraintreeAddressIdToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :braintree_address_id, :integer
  end
end
