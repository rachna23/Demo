class RemoveColumnFromUser < ActiveRecord::Migration[6.0]
  def change
  	remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :phone_number, :integer
    remove_column :users, :date_of_birth, :datetime
    remove_column :users, :is_female, :boolean, default: false
  end
end
