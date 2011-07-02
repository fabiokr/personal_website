class Blog::Article < ActiveRecord::Base
  include Admin::Models::Article

  attr_accessible :locale
  validates :locale, :presence => true, :inclusion => Rails.configuration.available_locales
end
