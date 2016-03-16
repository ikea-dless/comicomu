class TopsController < ApplicationController
  # ユーザーがログインしていないとアクセスできない
  before_action :authenticate_user!, only: :show

  def index
  end

  def show
  end
end
