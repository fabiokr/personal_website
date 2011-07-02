# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')

#Default content for pages
Admin::Page.generate!

#Application
page = Admin::Page.for_controller(ApplicationController.controller_path)
page.update_attributes(:title => 'Fabio Kreusch', :description => 'Fabio Kreusch personal website - Resume, previous works, blog', :keywords => 'fabio, kreusch, blog, resume, rails, developer, web, programming, ruby')

#Home page
page = Admin::Page.for_controller(HomesController.controller_path)
page.update_attributes(:title => 'Home')

#Blog Articles
(1..20).each do |i|
  Blog::Article.new(:title => Faker::Lorem.sentence, :excerpt => Faker::Lorem.paragraphs.join(' '), :body => Faker::Lorem.paragraphs.join(' '), :published_at => (DateTime.now - rand), 'locale' => 'pt').save!
end

(1..20).each do |i|
  Blog::Article.new(:title => Faker::Lorem.sentence, :excerpt => Faker::Lorem.paragraphs.join(' '), :body => Faker::Lorem.paragraphs.join(' '), :published_at => (DateTime.now - rand), 'locale' => 'en').save!
end
