require 'test_helper'

class BlogControllerTest < ActionController::TestCase
  def setup
    @published_article   = Factory(:blog_article, :published_at => DateTime.now)
    @unpublished_article = Factory(:blog_article, :published_at => false)
  end

  test 'on show should list published article' do
    get :show, :year => @published_article.published_at.strftime('%Y'), :month => @published_article.published_at.strftime('%m'), :day => @published_article.published_at.strftime('%d'), :slug => @published_article.to_url_param

    assert_equal @published_article, assigns[:article]
  end

  test 'on show should raise if article is invalid' do
    assert_raise ActiveRecord::RecordNotFound do
      get :show, :year => '2050', :month => '12', :day => '01', :slug => @unpublished_article.to_url_param
    end
  end
end
