require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest

  test '/ should be accessible' do
    visit '/'

    assert_equal 200, page.status_code
  end

  test '/en/home should be accessible' do
    ManageableContent::Engine.config.locales.each do |locale|
      visit "/#{locale}/home"

      assert_equal 200, page.status_code
    end
  end

  test 'should be able to view blog article' do
    locale_articles = {}

    ManageableContent::Engine.config.locales.each do |locale|
      locale_articles[locale] = (1..5).map{|i| Factory(:blog_article, :published_at => DateTime.now, :locale => locale.to_s)}
    end

    locale_articles.each do |locale, articles|
      articles.each do |article|
        visit "/#{locale}/blog"

        assert has_content?(article.title)
        assert has_content?(article.body)

        click_link article.title

        assert has_content?(article.title)
        assert has_content?(article.body)
      end
    end
  end

end
