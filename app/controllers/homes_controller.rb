class HomesController < ApplicationController
  def index
    @query = Post.ransack(params[:q])
    @posts = @query.result(distinct: true)
    @user = User.all
    @category = Category.all
  end
end
