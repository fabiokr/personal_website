class BlogController < ApplicationController

  def index
    @articles = Blog::Article.for_locale(params[:locale]).published.sorted.page(params[:page])
    @tags = tags
  end

  def show
    unless @article = Blog::Article.for_published_and_slug(Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i), params[:slug]).first
      raise ActiveRecord::RecordNotFound.new
    end

    I18n.locale = @article.locale
    @tags = tags
  end

  private

  def tags
    Blog::Article.tag_counts_on(:tags, :conditions => {:locale => I18n.locale})
  end
end
