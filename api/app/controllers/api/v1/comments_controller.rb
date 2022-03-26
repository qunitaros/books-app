class Api::V1::CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    
    if comment.save
      render json: { status: 200, comment: comment }
    else
      render json: { status: 500, comment: "作成に失敗しました。" }
    end
  end

  private

    def comment_params
      params.permit(:post_id, :user_id, :comment)
    end
end
