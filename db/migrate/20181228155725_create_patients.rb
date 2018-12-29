class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :sex
      t.date :date_of_birth
      t.references :agency, foreign_key: true

      t.timestamps
    end
  end
end
