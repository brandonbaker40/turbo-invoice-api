class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :user, foreign_key: true
      t.references :visit_type, foreign_key: true
      t.references :agency, foreign_key: true
      t.float :amount
      t.integer :arrangement

      t.timestamps
    end
  end
end
