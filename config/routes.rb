Rails.application.routes.draw do

  # Redireciona www para non-www
  if Rails.env.production?
    constraints(host: /^www\./i) do
      match '(*any)' => redirect { |params, request|
        URI.parse(request.url).tap { |uri| uri.host.sub!(/^www\./i, '') }.to_s
      }, via: [:get, :post]
    end
  end

  # Página root
  root 'home#index'

  # Instituições
  resources :institutions, :path => 'instituicao'

  # Newsletters
  resources :newsletters

  # Contato
  resources :contacts


  resources :posts, :path => 'blog'
  resources :ebooks
  resources :biographies
  resources :bibliographies
  resources :metaphors

  devise_for :users, controllers: {
      confirmations: "user/confirmations",
      omniauth: "user/omniauth",
      passwords: "user/passwords",
      registrations: "user/registrations",
      sessions: "user/sessions",
      unlocks: "user/unlocks",
  }, :path => 'usuario', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      confirmation: 'verification',
      unlock: 'unblock',
      registration: 'register',
      sign_up: 'cmon_let_me_in'
  }

  devise_for :admins, controllers: {
      confirmations: "admin/confirmations",
      omniauth: "admin/omniauth",
      passwords: "admin/passwords",
      registrations: "admin/registrations",
      sessions: "admin/sessions",
      unlocks: "user/unlocks",
  }, path_names: {
      sign_up: ''
  }

  get 'facebook', to: redirect('https://www.facebook.com/masteringpnl')
  get 'googleplus', to: redirect('http://google.com/+Masteringpnl_channel')
  get 'twitter', to: redirect('https://twitter.com/masteringpnl')
  get 'youtube', to: redirect('http://youtube.com/c/Masteringpnl_channel')
  get 'thiagotadashi', to: redirect('http://thiagotadashi.com')
  get 'digitalocean', to: redirect('https://m.do.co/c/37a21a960bcd')
  get 'feed_path', to: redirect('/feed.rss')

  get 'sitemaps/index'

  get 'contato' => 'home#contact'
  get 'sobre-nos' => 'home#about_us'
  post 'enviar' => 'home#send_email'

  get 'feed.rss', :controller => 'feed', :action => 'rss', :format => 'rss', as: 'feed'
  get 'sitemap.xml' => 'sitemaps#index', :format => 'xml', :as => :sitemap

  match '/404', :to => 'errors#not_found', :via => :all
  match '/422', :to => 'errors#unprocessable_entity', :via => :all
  match '/500', :to => 'errors#internal_server_error', :via => :all

  get 'errors/not_found'
  get 'errors/internal_server_error'

  mount RailsAdmin::Engine => '/cms', as: 'rails_admin'

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
