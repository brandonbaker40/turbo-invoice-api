class AddDateToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :date, :datetime
  end
end
