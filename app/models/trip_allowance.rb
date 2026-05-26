class TripAllowance < ApplicationRecord
  belongs_to :expense_claim

  enum day_type: {
    day_trip:     0,  # 日帰り
    first_day:    1,  # 初日
    stay:         2,  # 滞在日
    last_day:     3   # 最終日
  }

  enum trip_type: {
    business: 0,  # 出張
    outing:   1   # 外出
  }

  enum lunch_self_pay: {
    lunch_yes:     0,  # あり
    lunch_no:      1,  # なし
    lunch_company: 2   # 会社手配
  }

  enum dinner_self_pay: {
    dinner_yes:     0,  # あり
    dinner_no:      1,  # なし
    dinner_company: 2   # 会社手配
  }
  # バリデーション
  validates :trip_date, presence: true
  validates :day_type,  presence: true

  # 保存する前に日当を自動計算
  before_save :calculate_daily_allowance

  private

  def calculate_daily_allowance
    base = case day_type
           when "day_trip"  then 1000
           when "first_day" then 1500
           when "stay"      then 2000
           when "last_day"  then 1000
           else 0
           end

    # 昼食を自分で払う場合は追加
    base += 500  if lunch_yes?
    # 夕食を自分で払う場合は追加
    base += 500  if dinner_yes?

    self.daily_allowance = base
  end
end
