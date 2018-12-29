class CreateAgencyRates < ActiveRecord::Migration[5.2]
  def change
    create_table :agency_rates do |t|
      t.references :agency, foreign_key: true
      t.references :visit_type, foreign_key: true
      t.float :amount
      t.integer :arrangement

      t.timestamps
    end
  end
end
