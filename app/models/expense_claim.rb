class ExpenseClaim < ApplicationRecord
  belongs_to :user
  has_many :expense_items,   dependent: :destroy
  has_many :trip_allowances, dependent: :destroy
  has_many :comments,        dependent: :destroy

  enum claim_type: { regular: 0, business_trip: 1 }
  enum status:     { draft: 0, submitted: 1 }
  # バリデーション
  validates :title, presence: true
  validates :claim_type, presence: true
  validates :status, presence: true
  # デフォルト値
  after_initialize :set_defaults, if: :new_record?

  private
  def set_defaults
    self.status ||= :draft
    self.total_amount ||= 0
  end
end
