class TopsController < ApplicationController
  # ユーザーがログインしていないとアクセスできない
  before_action :authenticate_user!, only: :show

  def index
    @posts = Post.all
  end

  def show
  end
end
