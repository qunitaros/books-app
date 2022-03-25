class Api::V1::PostsController < ApplicationController
  def index
    posts = []
    #PostにUserModelを付与
    Post.all.order("created_at DESC").each{|post| posts <<{ post: post, user: post.user }}
    render json: { status: 200, posts: posts }
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: { status: 200, post: post }
    else
      render json: { status: 500, message: "作成に失敗しました。" }
    end
  end

  def destroy 
    @post = Post.find(params[:id])
    
    if @post.user_id == current_api_v1_user.id
      @post.destroy
      render json: { status: 200, post: @post }
    else
      render json: { status: 500, message: "削除に失敗しました。" }
    end
  end

 
  private

    def post_params
      params.permit(:content, :user_id, :book_id, :cocktail_id)
    end
end
