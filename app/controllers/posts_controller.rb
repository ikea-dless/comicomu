class PostsController < ApplicationController
  before_action :user_signed_in?, only: [:new, :create, :destroy]

  def new
    @post = current_user.posts.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿に成功しました。"
    else
      flash[:alert] = "投稿に失敗しました。"
    end
    redirect_to root_path
  end

  def destroy
    if current_user.id == params[:user_id].to_i
      @post = Post.find(params[:id])
      if @post
        @post.destroy
        flash[:notice] = "記事を削除しました。"
      else
        flash[:alert] = "記事の削除に失敗しました。"
      end
    else
      flash[:alert] = "自分の記事以外は削除できません。"
    end
    redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :deadline_at)
    end
end
