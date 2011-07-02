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

  Rails.configuration.available_locales.each do |locale|
    should allow_value(locale).for(:locale)
  end

  should_not allow_value('invalid').for(:locale)
end
