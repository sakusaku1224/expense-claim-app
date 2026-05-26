class CreateExpenseItems < ActiveRecord::Migration[7.2]
  def change
    create_table :expense_items do |t|
      t.references :expense_claim, null: false, foreign_key: true
      t.string :description
      t.integer :category
      t.date :date
      t.integer :amount
      t.integer :tax_rate
      t.string :payment_to

      t.timestamps
    end
  end
end
