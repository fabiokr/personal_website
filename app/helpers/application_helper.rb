module ApplicationHelper

  def clear_array(array)
    array.compact.reject(&:blank?)
  end

  def get_title
    title = [managable_layout_content_for(:title), managable_content_for(:title)]
    title << content_for(:title) if content_for?(:title)
    title << @seo.title unless @seo.nil?
    title_join title
  end

  def title_join(values)
    clear_array(values).join(' : ')
  end

  def get_description
    description = [managable_layout_content_for(:description), managable_content_for(:description)]
    description << content_for(:description) if content_for?(:description)
    description << @seo.description unless @seo.nil?
    clear_array(description).join('; ')
  end

  def get_keywords
    keywords = [managable_layout_content_for(:keywords), managable_content_for(:keywords)]
    keywords << content_for(:keywords) if content_for?(:keywords)
    keywords << @seo.keywords unless @seo.nil?
    clear_array(keywords).join(', ')
  end

  def get_updated_at
    @seo && @seo.updated_at ? @seo.updated_at : managable_content_for(:updated_at)
  end

  def sitemap_category_entry(category, url_path)
    sitemap_entry send(url_path, :category_id => category.to_url_param)
  end

  def sitemap_article_entry(article, url_path)
    sitemap_entry send(url_path, :category_id => article.category.to_url_param, :article_id => article.to_url_param)
  end

  def sitemap_entry(url)
    content_tag(:url) do
      content_tag(:loc) do
        request.protocol + request.host_with_port + url
      end
    end
  end

  def blog_post_url(article)
    blog_post_path(:year => article.published_at.strftime('%Y'), :month => article.published_at.strftime('%m'), :day => article.published_at.strftime('%d'), :slug => article.to_url_param)
  end

  def previous_page_link(scope)
    if scope.num_pages > 1 && !scope.first_page?
      url = params.merge('page' => (scope.current_page - 1))
      link_to(t('previous_page').html_safe, url)
    end
  end

  def next_page_link(scope)
    if scope.num_pages > 1 && !scope.last_page?
      url = params.merge('page' => (scope.current_page + 1))
      link_to(t('next_page').html_safe, url)
    end
  end

end
