class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
    	t.string :country, null: false, default: ''
      t.string :city, null: false, default: ''
      t.string :state, null: false, default: ''
      t.string :pincode, null: false, default: ''
      t.string :landmark, null: false, default: ''
      t.string :address, null: false, default: ''
      t.string :street_address, null: false, default: ''
      t.timestamps
    end
  end
end
