class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.references :patient, foreign_key: true
      t.references :agency, foreign_key: true
      t.references :user, foreign_key: true
      t.references :visit_type, foreign_key: true
      t.datetime :time_in
      t.datetime :time_out
      t.text :note

      t.timestamps
    end
  end
end
