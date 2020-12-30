class ChangeIdToState < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :state, :state_id
  end
end

