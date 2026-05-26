class TripAllowancesController < ApplicationController
  before_action :set_expense_claim
  before_action :set_trip_allowance, only: %i[update destroy]
  def create
    @trip_allowance = @expense_claim.trip_allowances.build(trip_allowance_params)
    if @trip_allowance.save
      redirect_to @expense_claim, notice: "日当明細を追加しました"
    else
      redirect_to @expense_claim, alert: "日当明細の追加に失敗しました"
    end
  end

  def update
    if @trip_allowance.save(trip_allowance_params)
      redirect_to @expense_claim, notice: "日当明細を更新しました"
    else
      redirect_to @expense_claim, alert: "日当明細の更新に失敗しました"
    end
  end

  def destroy
    @trip_allowance.destroy
    redirect_to @expense_claim, notice: "日当明細を削除しました"
  end

  private

  # 親の申請を取得
  def set_expense_claim
    @expense_claim = current_user.expense_claims.find(params[:expense_claim_id])
  end

  # 日当明細を取得
  def set_trip_allowance
    @trip_allowance = @expense_claim.trip_allowances.find(params[:id])
  end

  def trip_allowance_params
    params.require(:trip_allowance).permit(
      :trip_date,
      :date_type,
      :trip_type,
      :lunch_self_pay,
      :dinner_self_pay
    )
  end
end
