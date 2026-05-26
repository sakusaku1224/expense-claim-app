class CreateTripAllowances < ActiveRecord::Migration[7.2]
  def change
    create_table :trip_allowances do |t|
      t.references :expense_claim, null: false, foreign_key: true
      t.date :trip_date
      t.integer :day_type
      t.integer :trip_type
      t.integer :lunch_self_pay
      t.integer :dinner_self_pay
      t.integer :daily_allowance

      t.timestamps
    end
  end
end
