class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :integer
    add_column :users, :date_of_birth, :datetime
    add_column :users, :is_female, :boolean, default: false
  end
end
