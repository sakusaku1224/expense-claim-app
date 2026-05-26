class CreateExpenseClaims < ActiveRecord::Migration[7.2]
  def change
    create_table :expense_claims do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :claim_type
      t.integer :status
      t.integer :total_amount

      t.timestamps
    end
  end
end
