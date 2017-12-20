Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  
  #pages
  get '/servicios', to: redirect('/#services')
  get '/promociones', to: 'pages#promociones'
  get '/noticias', to: 'pages#noticias'
  get '/nosotros', to: 'pages#nosotros'
  get '/contacto', to: 'pages#contacto'
  get '/app_movil', to: 'pages#app_movil'
  get '/buzon_sugerencias', to: 'pages#buzon_sugerencias'
  post '/guardar_sugerencia', to: 'pages#guardar_sugerencia'
  
  #single
  get '/single_promocion/:id', to: 'single#single_promocion'
  get '/single_noticia/:id', to: 'single#single_noticia'
  
  #user
  get '/login', to: 'user#login'
  get '/registration', to: 'user#registration'
  
  # Metodos
  get '/log_out', to: 'user#log_out'
  get '/log_out_web', to: 'user#log_out_web'
  post '/iniciar_sesion', to: 'user#iniciar_sesion'

  
  # Tribago
  post '/tribago', to: 'welcome#tribago'

  post '/guardar', to: 'user#guardar'

  post '/buscarCiudadPorEstado', to: 'user#buscarCiudadPorEstado'  
  post '/buscarMunicipioPorCiudad', to: 'user#buscarMunicipioPorCiudad'
  post '/buscarParroquiaPorMunicipio', to: 'user#buscarParroquiaPorMunicipio'
  post '/buscarSectorPorParroquia', to: 'user#buscarSectorPorParroquia'
  post '/validar_cliente', to: 'user#validar_cliente'



  
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
