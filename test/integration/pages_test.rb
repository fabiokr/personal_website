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

end
