class TopController < ApplicationController
  def index
    # 月の開始日・終了日を取得する
    beginning = Date.current.beginning_of_month
    ending = Date.current.end_of_month

    # 月の通常立替合計
    @total_regular = current_user.expense_claims
                                 .regular
                                 .where(created_at: beginning..ending)
                                 .sum(:total_amount)
    # 月の出張日当合計
    @total_trip = current_user.expense_claims
                              .business_trip
                              .where(created_at: beginning..ending)
                              .sum(:total_amount)
    # 下書き件数
    @draft_count = current_user.expense_claims.draft.count
    # 提出済み件数
    @submitted_count = current_user.expense_claims.submitted.count
    # 最近の申請（新しい順5件を表示）
    @recent_claims = current_user.expense_claims.order(created_at: :desc).limit(5)
  end
end
