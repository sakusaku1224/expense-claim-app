class CommentsController < ApplicationController
  before_action :set_expense_claim

  # コメント作成
  def create
    @comment = @expense_claim.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @expense_claim
    else
      redirect_to @expense_claim
    end
  end

  # コメント削除
  def destroy
    @comment = @expense_claim.comments.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
    end
    redirect_to @expense_claim
  end

  private

  # 親の申請を取得
  def set_expense_claim
    @expense_claim = current_user.expense_claims.find(params[:expense_claim_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
