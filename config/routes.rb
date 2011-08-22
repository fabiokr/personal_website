PersonalWebsite::Application.routes.draw do

  namespace :ckeditor do
    resources :pictures, :only => [:index, :create, :destroy]
    resources :attachment_files, :only => [:index, :create, :destroy]
  end

  match 'admin' => 'admin/dashboards#show'
  match '/auth/admin/callback', :to => 'admin/user_sessions#create' 
  namespace 'admin' do
    resource :user_session, :only => [:new, :destroy]
    resource :dashboard, :only => [:show]
    resource :demo, :only => [:show]
    resources :users
    resources :pages
    
    namespace :blog do
      resources :articles
    end
  end

  scope "(:locale)", :locale => /en|pt/ do
    match 'home' => 'homes#index', :as => 'home'
    match 'blog' => 'blog#index',  :as => 'blog'
    match 'blog/tags/:tag' => 'blog_tags#show', :as => 'blog_tag'
  end

  match ":year/:month/:day/:slug" => "blog#show", :constraints => { :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ }, :as => 'blog_post'

  root :to => "homes#index"

  #match '*a', :to => 'errors#404'
end
