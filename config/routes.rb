PersonalWebsite::Application.routes.draw do

  devise_for :admin_users, :path => 'admin'

  namespace :ckeditor do
    resources :pictures, :only => [:index, :create, :destroy]
    resources :attachment_files, :only => [:index, :create, :destroy]
  end

  match 'admin' => 'admin/dashboards#show'
  namespace 'admin' do
    resources :users
    resource :dashboard, :only => [:show]
    resource :demo, :only => [:show]
    resources :pages

    namespace :blog do
      resources :articles
    end
  end

  scope "(:locale)", :locale => /en|pt/ do
    match 'home' => 'homes#index', :as => 'home'
  end

  match ":year/:month/:day/:slug" => "blog#show", :constraints => { :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ }

  root :to => "homes#index"

  match '*a', :to => 'errors#404'
end
