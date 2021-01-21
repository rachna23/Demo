class AddPaymentStatusToUser < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :payment_status, :string
  end
end
