require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest

  test '/ should be accessible' do
    visit '/'

    assert_equal 200, page.status_code
  end

end
