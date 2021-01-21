#create states
class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :short_name
      t.string :name

      t.timestamps
    end
  end
end
