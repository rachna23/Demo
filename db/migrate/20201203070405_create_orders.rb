class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :pay_method

      t.timestamps
    end
  end
end
