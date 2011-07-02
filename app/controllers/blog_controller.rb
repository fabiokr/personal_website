class BlogController < ApplicationController

  def index
    @articles = Blog::Article.for_locale(params[:locale]).published.sorted.limit(10)
  end

  def show
    unless @article = Blog::Article.for_published_and_slug(Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i), params[:slug]).first
      raise ActiveRecord::RecordNotFound.new
    end
  end
end
