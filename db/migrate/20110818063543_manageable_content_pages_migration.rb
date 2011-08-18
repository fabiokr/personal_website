class AdminPage < ActiveRecord::Base
  has_many :page_contents, :class_name => "AdminPageContent", :foreign_key => :page_id
end

class AdminPageContent < ActiveRecord::Base
end

class ManageableContentPagesMigration < ActiveRecord::Migration
  def up
    AdminPage.all.each do |old_page|
      page = ManageableContent::Page.new
      page.key = old_page.controller_path
      page.locale = old_page.locale
      page.save!

      old_page.page_contents.each do |old_page_content|
        page_content = page.page_contents.build
        page_content.key = old_page_content.key
        page_content.content = old_page_content.content
        page_content.save!
      end

      # title
      page_content = page.page_contents.build
      page_content.key = :title
      page_content.content = old_page.title
      page_content.save!

      # description
      page_content = page.page_contents.build
      page_content.key = :description
      page_content.content = old_page.description
      page_content.save!

      # keywords
      page_content = page.page_contents.build
      page_content.key = :keywords
      page_content.content = old_page.keywords
      page_content.save!
    end
  end

  def down
  end
end
