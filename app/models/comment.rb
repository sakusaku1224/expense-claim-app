class Comment < ApplicationRecord
  belongs_to :expense_claim
  belongs_to :user
  # バリデーション
  validates :body, presence: true
end
