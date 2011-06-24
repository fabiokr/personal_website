module Admin
  module Controllers
    # This module can be used on website controllers that will access articles.
    module Articles
      extend ActiveSupport::Concern

      included do
        before_filter :get_categories
        before_filter :get_category
        mattr_accessor :category_model, :article_model, :categories_path, :category_path,
                       :article_path, :categories_title, :paginate

        self.paginate = 10

        render_inheritable

        # Need to redefine after render_inheritable
        def self.template_lookup_path(param = nil)
          paths = super(param)
          paths << 'articles'
        end
      end

      module ClassMethods
      end

      module InstanceMethods
        def index
          @articles = @category.articles.published.sorted
          @articles = @articles.page(params[:page]).per(paginate) if self.class.paginate
        end

        def show
          unless @article = @category.articles.published.for_url_param(params[:article_id]).first
            raise ActiveRecord::RecordNotFound.new
          end

          @seo = Admin::Seo.new
          @seo.title =        @article.title
          @seo.description =  @article.description
          @seo.keywords =     @article.keywords
          @seo.updated_at =   @article.updated_at

          add_breadcrumb @article.title, path(self.class.article_path, :category_id => @category.slug, :article_id => @article.slug)
        end

        protected

        def get_categories
          @categories = self.class.category_model.sorted
        end

        def get_category
          category_id = params[:category_id]

          if category_id
            unless @category = self.class.category_model.for_url_param(category_id).first
              raise ActiveRecord::RecordNotFound.new
            end

            add_breadcrumb managable_content_for(:title), path(self.class.categories_path)
            add_breadcrumb @category.name, path(self.class.category_path, :category_id => @category.slug)
          else
            redirect_to path(self.class.category_path, :category_id => self.class.category_model.sorted.first.slug)
          end
        end

        def path(path, params = {})
          send "#{path}_path", params
        end
      end

    end
  end
end
