# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

AdminUser.create!(:email => 'fabiokr@gmail.com')

#Default content for pages
ManageableContent::Manager.generate!

ManageableContent::Engine.config.locales.each do |locale|
  #Application
  page = ManageableContent::Manager.page(ApplicationController.controller_path, locale).first
  page.update_attributes(:title => 'Fabio Kreusch', :description => 'Fabio Kreusch personal website - Resume, previous works, blog', :keywords => 'fabio, kreusch, blog, resume, rails, developer, web, programming, ruby')

  #Home page
  page = ManageableContent::Manager.page(HomesController.controller_path, locale).first
  page.update_attributes(:title => 'Home')

  blog_article_tags = (1..6).map{|i| Faker::Lorem.words.sample}

  #Blog Articles
  (1..20).each do |i|
    Blog::Article.create!(:title => Faker::Lorem.sentence, :body => '<p>'+Faker::Lorem.paragraphs.join(' ')+'</p>', :published_at => (DateTime.now - rand), :locale => locale, :tag_list => [blog_article_tags.sample, blog_article_tags.sample].join(', '))
  end
end
