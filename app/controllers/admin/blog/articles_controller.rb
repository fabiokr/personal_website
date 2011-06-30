module Admin
  module Blog
    class ArticlesController < Admin::Controllers::Resource
      defaults :resource_class => ::Blog::Article, :collection_name => 'articles', :instance_name => 'article'

      def self.template_lookup_path(param = nil)
        paths = super(param)
        paths << 'admin/articles'
      end
    end
  end
end
