class AddFnameToProfile < ActiveRecord::Migration[6.0]
  def change
  	add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :phone_number, :integer
    add_column :profiles, :date_of_birth, :datetime
    add_column :profiles, :is_female, :boolean, default: false
  end
end
