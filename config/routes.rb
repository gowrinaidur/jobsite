Rails.application.routes.draw do    


  #get 'welcome/index'
  # devise_scope :user do
  #   get "admin/sign_in", :to => "admin/sessions#new"
  # end
  devise_scope :user do
    get "admin/login", :to => "admin/sessions#new"    
  end
  
  #devise_for :users
  devise_for :users, :skip => [:registrations], :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'},:controllers => {:sessions=>"sessions"}

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  get 'employers' => 'employers#index'
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :job_seekers

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable
  get '/get_states' , :to => "admin_base#get_states"
  # Example resource route within a namespace:
    namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
      get '' , :to => "dashboard#index"
      #get 'dashboard' , :to => "dashboard#index"
      resources :job_seekers
      resources :admins
      resources :states
      resources :countries
    end
    
end