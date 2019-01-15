class AddUserToVisitRateClearance < ActiveRecord::Migration[5.2]
  def change
    add_reference :visits, :user, foreign_key: true
    add_reference :rates, :user, foreign_key: true
    add_reference :clearances, :user, foreign_key: true
  end
end
