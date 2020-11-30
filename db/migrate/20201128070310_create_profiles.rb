class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
    	t.string :company, null: false, default: ""
    	t.string :billing_address, null: false, default: ""
      t.timestamps
    end
  end
end

