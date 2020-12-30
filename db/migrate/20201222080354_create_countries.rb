class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :short_name
      t.string :name

      t.timestamps
    end
  end
end
