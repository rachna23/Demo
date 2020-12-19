class AddProfileIdToAddress < ActiveRecord::Migration[6.0]
  def change
  	  add_column :addresses, :profile_id, :integer
  end
end
