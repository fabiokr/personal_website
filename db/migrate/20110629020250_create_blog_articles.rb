class CreateBlogArticles < ActiveRecord::Migration
  def self.up
    create_table :blog_articles do |t|
      t.article_fields
    end

    article_indexes :blog_articles
  end

  def self.down
    drop_table :blog_articles
  end
end
