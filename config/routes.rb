IdeaFarm::Application.routes.draw do
  get "comments/new"
  get "comments/create"
  get "comments/show"
  get "comments/edit"
  get "ideas/new"
  get "ideas/create"
  get "ideas/show"
  get "ideas/destroy"
  get "idea/new"
  get "idea/create"
  get "idea/show"
  get "idea/destroy"
  resources :users
  resources :ideas do
    resources :comments
  end
  resources :sessions, only: [:new, :create, :destroy]
  root  'ideas#index'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  get 'static_pages/home' => 'static_pages#home'

  match 'ideas/:id/flag', to: 'ideas#flag', via: 'post'
  match 'ideas/:id/flag', to: 'ideas#flag', via: 'get'
  match '/flagged_index', to: 'ideas#flagged_index', via: 'get'
  match '/comments_index', to: 'ideas#comments_index', via: 'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
