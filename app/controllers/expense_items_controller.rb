class ExpenseItemsController < ApplicationController
  before_action :set_expense_claim
  before_action :set_expense_item, only: %i[update destroy]

  # 明細作成
  def create
    @expense_item = @expense_claim.expense_items.build(expense_item_params)
    if @expense_item.save
      redirect_to @expense_claim, notice: "明細を追加しました"
    else
      redirect_to @expense_claim, alert: "明細の追加に失敗しました"
    end
  end

  # 明細更新
  def update
    if @expense_item.update(expense_item_params)
      redirect_to @expense_claim, notice: "明細を更新しました"
    else
      redirect_to @expense_claim, alert: "明細の追加に失敗しました"
    end
  end

  # 明細削除
  def destroy
    @expense_item.destroy
    redirect_to @expense_claim, notice: "明細を削除しました"
  end

  private

  # 親の申請を取得
  def set_expense_claim
    @expense_claim = current_user.expense_claims.find(params[:expense_claim_id])
  end

  # 明細を取得（親経由で取得することで他人のデータを守る）
  def set_expense_item
    @expense_item = @expense_claim.expense_items.find(params[:id])
  end

  def expense_item_params
    params.require(:expense_item).permit(
      :description,
      :category,
      :date,
      :payment_to,
      :tax_rate,
      :amount,
      :receipt
    )
  end
end
