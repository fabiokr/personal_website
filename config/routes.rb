PersonalWebsite::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created > highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with subresources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex subresources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'

  namespace :ckeditor do
    resources :pictures, :only => [:index, :create, :destroy]
    resources :attachment_files, :only => [:index, :create, :destroy]
  end

  match 'admin' => 'admin/dashboards#show'
  match '/auth/admin/callback', :to => 'admin/user_sessions#create' 
  namespace 'admin' do
    resources :users
    resource :dashboard, :only => [:show]
    resource :demo, :only => [:show]
    resources :pages
    resource :user_session, :only => [:new, :destroy]
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
