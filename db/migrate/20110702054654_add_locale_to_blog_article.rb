class AddLocaleToBlogArticle < ActiveRecord::Migration
  def self.up
    change_table :blog_articles do |t|
      t.locale_fields
    end

    add_index :blog_articles, [:published_at, :locale]
  end

  def self.down
    remove_column :blog_articles, :locale
  end
end
