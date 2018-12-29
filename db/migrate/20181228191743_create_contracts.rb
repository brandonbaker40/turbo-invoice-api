class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.references :agency, foreign_key: true
      t.date :effective_date
      t.date :termination_date

      t.timestamps
    end
  end
end
