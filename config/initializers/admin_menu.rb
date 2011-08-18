Rails.application.config.admin_menu = Admin::Menu.configure do
  #Pages
  menu ManageableContent::Page, :plural => true do
    item :admin_pages_path, :title => proc { I18n.t("admin.index_resource", :resource_name => ManageableContent::Page.model_name.human.pluralize) }, :icon => 'edit_article'
  end

  #Custom

  #Blog
  menu Blog::Article, :plural => true do
    item :new_admin_blog_article_path, :title => proc { I18n.t("admin.new_resource", :resource_name => Blog::Article.model_name.human) }, :icon => 'new_article'
    item :admin_blog_articles_path, :title => proc { I18n.t("admin.index_resource", :resource_name => Blog::Article.model_name.human.pluralize) }, :icon => 'edit_article'
  end

  #Users
  menu AdminUser do
    item :new_admin_user_path, :title => proc { I18n.t("admin.new_resource", :resource_name => AdminUser.model_name.human) }, :icon => 'add_user'
    item :admin_users_path, :title => proc { I18n.t("admin.index_resource", :resource_name => AdminUser.model_name.human.pluralize) }, :icon => 'view_users'
  end
end
