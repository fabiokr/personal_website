require 'test_helper'

class Blog::ArticleTest < ActiveSupport::TestCase
  include Admin::Models::ArticleTest

  self.article_model   = Blog::Article
  self.article_factory = :blog_article
  self.sortable_factory = :blog_article

  should have_db_column(:locale).of_type(:string)
  should have_db_index([:published_at, :locale])
  should allow_mass_assignment_of(:locale)
  should validate_presence_of(:locale)

  ManageableContent::Engine.config.locales.each do |locale|
    should allow_value(locale.to_s).for(:locale)
  end

  should_not allow_value('invalid').for(:locale)

  test 'should have for_locale scope' do
    ManageableContent::Engine.config.locales.each do |locale|
      Factory(:blog_article, :published_at => DateTime.new(2011, 6, 30), :locale => locale.to_s)
    end

    locale = ManageableContent::Engine.config.locales
    assert_equal Blog::Article.where(:locale => locale), Blog::Article.for_locale(locale)
  end

  test 'should have for_published_and_slug scope' do
    post = Factory(:blog_article, :published_at => DateTime.new(2011, 6, 30), :title => "My Article")

    assert_equal post, Blog::Article.for_published_and_slug(post.published_at, post.to_url_param).first
  end
end
