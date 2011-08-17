class Blog::Article < ActiveRecord::Base
  include Admin::Models::Article

  attr_accessible :locale, :tag_list
  validates :locale, :presence => true, :inclusion => ManageableContent::Engine.config.locales.map {|l| l.to_s}

  scope :for_locale, lambda {|locale| where(:locale => locale)}
  scope :for_published_and_slug, lambda {|published_at, slug| where(:published_at => (published_at.beginning_of_day)..(published_at.end_of_day), :slug => slug) }

  paginates_per 10

  acts_as_taggable
end
