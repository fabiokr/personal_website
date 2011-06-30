require 'test_helper'

class Blog::ArticleTest < ActiveSupport::TestCase
  include Admin::Models::ArticleTest

  self.article_model   = Blog::Article
  self.article_factory = :blog_article
  self.sortable_factory = :blog_article
end
