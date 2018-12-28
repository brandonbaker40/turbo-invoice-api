class CreateAgencies < ActiveRecord::Migration[5.2]
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :phone
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.boolean :approved

      t.timestamps
    end
  end
end
