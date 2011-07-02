require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest

  test '/ should be accessible' do
    visit '/'

    assert_equal 200, page.status_code
  end

  test '/en/home should be accessible' do
    visit '/en/home'

    assert_equal 200, page.status_code
  end

  test '/pt/home should be accessible' do
    visit '/pt/home'

    assert_equal 200, page.status_code
  end

  test '/2011/06/30/my-article should be accessible' do
    post = Factory(:blog_article, :published_at => DateTime.new(2011, 6, 30), :title => "My Article")

    visit '/2011/06/30/my-article'

    assert has_content?(post.title)
    assert has_content?(post.body)
  end

end
