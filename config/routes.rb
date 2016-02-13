Rails.application.routes.draw do

  get 'sitemaps/index'

  resources :ebooks
  resources :bibliographies
  resources :metaphors

  devise_for :users, path_names: {
      sign_up: ''
  }

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  root 'home#index'

  get 'facebook', to: redirect('https://www.facebook.com/masteringpnl')
  get 'googleplus', to: redirect('http://google.com/+Masteringpnl_channel')
  get 'twitter', to: redirect('https://twitter.com/masteringpnl')
  get 'youtube', to: redirect('http://youtube.com/c/Masteringpnl_channel')
  get 'thiagotadashi', to: redirect('http://thiagotadashi.com')
  get 'feed_path', to: redirect('/feed.rss')

  get 'contato' => 'home#contact'
  get 'sobre-nos' => 'home#about_us'
  post 'enviar' => 'home#deliver'

  get 'feed.rss', :controller => 'feed', :action => 'rss', :format => 'rss', as: 'feed'
  get 'sitemap.xml' => 'sitemaps#index', :format => 'xml', :as => :sitemap

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
