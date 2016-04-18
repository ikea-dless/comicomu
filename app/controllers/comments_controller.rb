class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if user_signed_in?
      @comment = @post.comments.create(comment_params)
      @comment.username = current_user.username
      if @comment.save
        flash[:notice] = "投稿に成功しました。"
      else
        flash[:alert] = "投稿に失敗しました。"
      end
    else
      flash[:alert] = "ログインしてください。"
    end
    redirect_to post_path(@post)
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
