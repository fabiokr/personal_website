# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')

#Default content for pages
ManageableContent::Generator.generate!

#Application
page = ManageableContent::Page.for_controller(ApplicationController.controller_path)
page.update_attributes(:title => 'Fabio Kreusch', :description => 'Fabio Kreusch personal website - Resume, previous works, blog', :keywords => 'fabio, kreusch, blog, resume, rails, developer, web, programming, ruby')

#Home page
page = ManageableContent::Page.for_controller(HomesController.controller_path)
page.update_attributes(:title => 'Home')

blog_article_tags = (1..6).map{|i| Faker::Lorem.words.sample}

#Blog Articles
(1..40).each do |i|
  Blog::Article.new(:title => Faker::Lorem.sentence, :body => '<p>'+Faker::Lorem.paragraphs.join(' ')+'</p>', :published_at => (DateTime.now - rand), :locale => 'pt', :tag_list => [blog_article_tags.sample, blog_article_tags.sample].join(', ')).save!
end

(1..40).each do |i|
  Blog::Article.new(:title => Faker::Lorem.sentence, :body => '<p>'+Faker::Lorem.paragraphs.join(' ')+'</p>', :published_at => (DateTime.now - rand), :locale => 'en', :tag_list => [blog_article_tags.sample, blog_article_tags.sample].join(', ')).save!
end
