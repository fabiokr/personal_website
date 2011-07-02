class Blog::Article < ActiveRecord::Base
  include Admin::Models::Article

  attr_accessible :locale
  validates :locale, :presence => true, :inclusion => Rails.configuration.available_locales

  scope :for_published_and_slug, lambda {|published_at, slug| where(:published_at => (published_at.beginning_of_day)..(published_at.end_of_day), :slug => slug) }
end
