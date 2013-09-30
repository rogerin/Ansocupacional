Ansexameonline::Application.routes.draw do



  root :to => "page#index"

  match 'users/desabilitar/:id' => 'users#desabilitar', :as => :desabilitar
  match 'users/habilitar/:id' => 'users#habilitar', :as => :habilitar
  
  match 'empresas/desabilitar/:id' => 'empresas#desabilitar', :as => :desabilitar_empresa
  match 'empresas/habilitar/:id' => 'empresas#habilitar', :as => :habilitar_empresa
  

  get "page/index"
  get "page/login"
  get "sessions/logout"

  
  post "consultas/busca"
  get "consultas/busca"

  post "log_empresas/busca"

  match "users/alterar_imagem/:id" => "users#alterar_imagem", :as => :alterar_imagem
  post "users/update_imagem"
 
  post "funcionarios/busca"
  get "funcionarios/busca"

  post "javascripts/funcionarios_dinamicos"
  post "javascripts/valida_funcionario_rg"

  post "assets/download"
  resources :log_empresas

  resource :sessions
  resources :funcionarios
  resources :empresas
  resources :users
  resources :categorias
  resources :consultas


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
