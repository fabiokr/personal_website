class Blog::Article < ActiveRecord::Base
  include Admin::Models::Article
end
