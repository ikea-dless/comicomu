class TopsController < ApplicationController
  # ユーザーがログインしていないとアクセスできない
  before_action :authenticate_user!, only: :show

  def index
    @posts = Post.all
  end

  def show
    @user = current_user
    @posts = @user.posts
    @favorites = @user.favorites
  end
end
