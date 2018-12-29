class CreateClearances < ActiveRecord::Migration[5.2]
  def change
    create_table :clearances do |t|
      t.references :user, foreign_key: true
      t.references :agency, foreign_key: true

      t.timestamps
    end
  end
end
