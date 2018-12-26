# frozen_string_literal: true

class CreateDisciplines < ActiveRecord::Migration[5.2]
  def change
    create_table :disciplines do |t|
      t.string :name
      t.string :field
      t.string :job_title
      t.string :abbreviation

      t.timestamps
    end
  end
end
