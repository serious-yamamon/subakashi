class SeriesController < ApplicationController
  def show
      @series = Series.find_by(id: params[:id])
      @posts = @series.posts.published.default_order.page(params[:page]).per(12) if @series.posts
      @slider_posts = Post.published.favorite.default_order.limit(8)
  end
end
