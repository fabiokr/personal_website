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
  end

  match 'about' => 'about#index', :as => 'about'
  root :to => "homes#index"
end
