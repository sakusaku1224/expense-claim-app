class ExpenseItem < ApplicationRecord
  belongs_to :expense_claim
  # Active Storageを使用
  has_one_attached :receipt

  enum category: {
    food:          0,  # 食費
    transport:     1,  # 交通費
    supplies:      2,  # 消耗品費
    accommodation: 3,  # 宿泊費
    other:         4   # その他
  }

  enum tax_rate: {
    standard: 0,  # 10%
    reduced:  1,  # 8%
    exempt:   2   # 非課税
  }
  # バリデーション
  validates :description, presence: true
  validates :amount,      presence: true, numericality: { greater_than: 0 }
  validates :date,        presence: true
  validates :category,    presence: true
  validates :tax_rate,    presence: true

  # 明細が保存・削除されたら合計を更新
  after_save    :update_claim_total
  after_destroy :update_claim_total
  private
  def update_claim_total
    expense_claim.update_column(
      :total_amount,
      expense_claim.expense_items.sum(:amount)
    )
  end
end
