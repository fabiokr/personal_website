module Admin
  module Blog
    class ArticlesController < Admin::Controllers::Resource
      defaults :resource_class => ::Blog::Article, :collection_name => 'articles', :instance_name => 'article'
    end
  end
end
