#encoding: utf-8
Interfejs::Application.routes.draw do
  #get "helps/index"
  #get "homepages/index"
  #get "user_sessions/new"
  #get "user_sessions/create"
  #get "user_sessions/destroy"
  
  root :to => 'homepages#index' 
 
  resources :movies
  resources :statuses
  resources :tags
  resources :user_sessions, :only => [:new, :create, :destroy]
  resources :users

  # Linki do menu
  match 'profil' => 'users#edit', :as => :profil
  match 'wyszukaj' => 'movies#new', :as => :wyszukaj
  match 'filmy' => 'statuses#index', :as => :filmy
  match 'etykiety' => 'tags#index', :as => :etykiety
  match 'pomoc' => 'helps#index', :as => :pomoc
  match 'logowanie' => 'user_sessions#new', :as => :logowanie
  match 'wylogowanie' => 'user_sessions#destroy', :as => :wylogowanie
  
  # Inne linki
  match 'movies/new' => 'movies#search', :via => [:get, :post]  
  match 'rejestracja' => 'users#new', :as => :rejestracja
  match 'usun_konto' => 'users#destroy', :as => :usun_konto
  match 'etykiety/nowa' => 'tags#new', :as => :etyk_nowa
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
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
  # match ':controller(/:action(/:id))(.:format)'
end
