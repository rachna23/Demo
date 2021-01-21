class AddDefaultToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :default, :boolean
  end
end
