
class AddProfileIdToOrder < ActiveRecord::Migration[6.0]
  def change
  	add_column :orders, :profile_id, :integer
  end
end

