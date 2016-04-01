class Fpost::FavoritesController < ApplicationController
  def update
    @post = Post.find(params[:post_id])
    @favorite = user_favorites.first_or_initialize(favorite_params)
    if @favorite.save
      flash[:notice] = "参加を申請しました。"
    else
      flash[:alert] = "失敗しました。"
    end
    redirect_to post_path(id: @post.id)
  end

  private

    def user_favorites
      current_user.favorites.where(params.permit(:post_id))
    end

    def favorite_params
      { value: '1' }
    end
end
