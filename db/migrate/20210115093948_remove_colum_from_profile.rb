class RemoveColumFromProfile < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :date_of_birth, :datetime
    remove_column :profiles, :is_female, :boolean, default: false
    remove_column :profiles, :billing_address, :string
  end
end
