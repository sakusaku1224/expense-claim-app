class ExpenseClaimsController < ApplicationController
before_action :set_expense_claim, only: %i[show edit update destroy submit]
  def index
    # 一覧画面
    @q = current_user.expense_claims.ransack(params[:q])
    @expense_claims = @q.result.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    # 詳細画面
    # set_expense_claim実行済み
  end

  def new
    # 新規作成画面
    @expense_claim = current_user.expense_claims.build(expense_claim_params)
  end

  def create
    # 新規作成の処理
    if @expense_claim.save
      redirect_to @expense_claim, notice: "申請を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # 編集画面
    # set_expense_claim実行済み
  end

  def update
    # 更新処理
    if @expense_claim.update(expense_claim_params)
      redirect_to @expense_claim, notice: "申請を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end  end

  def destroy
    @expense_claim.destroy
    redirect_to expense_claims_path, notice: "申請を削除しました"
  end

  def submit
    # 提出処理
    if @expense_claim.draft?
      @expense_claim.update!(status: :submitted)
      redirect_to @expense_claim, notice: "提出しました"
    else
      redirect_to @expense_claim, notice: "すでに提出済みです"
    end
  end

  private
  def set_expense_claim
    @expense_claim =
    current_user.expense_claim.find(params[:id])
  end
  def expense_claim_params
    params.require(:expense_claim).permit(:title, :claim_type)
  end
end
