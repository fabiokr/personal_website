require 'test_helper'

class BlogControllerTest < ActionController::TestCase
  def setup
    @published_articles, @unpublished_articles = [], []
    locale = ManageableContent::Engine.config.locales.each do |locale|
      @published_articles   += (1..15).map{|i| Factory(:blog_article, :published_at => DateTime.now, :locale => locale.to_s)}
      @unpublished_articles += (1..15).map{|i| Factory(:blog_article, :published_at => nil, :locale => locale.to_s)}
    end
  end

  test 'on index should list articles for the locale' do
    locale = ManageableContent::Engine.config.locales.first.to_s

    get :index, :locale => locale

    assert_equal Blog::Article.for_locale(locale).published.sorted.page(nil), assigns[:articles]
  end

  test 'on show should list published article' do
    article = @published_articles.first

    get :show, :year => article.published_at.strftime('%Y'), :month => article.published_at.strftime('%m'), :day => article.published_at.strftime('%d'), :slug => article.to_url_param

    assert_equal article, assigns[:article]
  end

  test 'on show should raise if article is invalid' do
    assert_raise ActiveRecord::RecordNotFound do
      get :show, :year => '2050', :month => '12', :day => '01', :slug => @unpublished_articles.first.to_url_param
    end
  end
end
