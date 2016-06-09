Rails.application.routes.draw do

  resources :newsletters
  if Rails.env.production?
    constraints(host: /^(?!www\.)/i) do
      match '(*any)' => redirect { |params, request|
        URI.parse(request.url).tap { |uri| uri.host = "www.#{uri.host}" }.to_s }, via: [:get, :post]
    end
  end

  resources :contacts
  root 'home#index'

  resources :ebooks
  resources :posts, :path => 'blog'

  resources :biographies
  resources :bibliographies
  resources :metaphors

  devise_scope :user do
    get '/login' => 'user/sessions#new'
    get '/logout' => 'user/sessions#destroy'
  end

  devise_for :users, controllers: {
      confirmations: "user/confirmations",
      omniauth: "user/omniauth",
      passwords: "user/passwords",
      registrations: "user/registrations",
      sessions: "user/sessions",
      unlocks: "user/unlocks",
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

  get '/site/about', to: redirect('/', status: 302)
  get '/bibliografia/view/guia-de-pnl-programacao-neurolinguistica', to: redirect('/', status: 302)
  get '/default.php', to: redirect('/', status: 302)
  get '/bibliografia/view/introducao-a-neurolinguistica', to: redirect('/', status: 302)
  get '/bibliografia/view/pnl-sucesso-e-exito-pessoal', to: redirect('/', status: 302)
  get '/bibliografia/view/introducao-a-programacao-neurolinguistica-como-entender-e-influenciar-as-pessoas', to: redirect('/', status: 302)
  get '/site/index', to: redirect('/', status: 302)
  get '/site/contact', to: redirect('/', status: 302)
  get '/bibliografia/view/por-tras-da-consciencia', to: redirect('/', status: 302)
  get '/posts/1-7-citacoes-para-sentir-se-fantastico-por-richard-bandler', to: redirect('/', status: 302)
  get '/posts/5-principios-da-pnl', to: redirect('/', status: 302)
  get '/admin/site/login', to: redirect('/', status: 302)
  get '/posts/21-como-modelar-pessoas-confiantes', to: redirect('/', status: 302)
  get '/biographies/8-o-que-e-a-pnl', to: redirect('/', status: 302)
  get '/biographies/12-e-possivel-reprogramar-seu-cerebro-com-a-pnl', to: redirect('/', status: 302)
  get '/biographies/11-3-mitos-e-equivocos-sobre-pnl', to: redirect('/', status: 302)

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
