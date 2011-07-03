class BlogTagsController < BlogController

  def index
    raise ActionController::RoutingError
  end

  def show
    @articles = Blog::Article.for_locale(params[:locale]).published.sorted.page(params[:page]).tagged_with(params[:tag])
    @tags = tags
    render 'blog/index'
  end

end
