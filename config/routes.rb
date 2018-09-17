Rails.application.routes.draw do
  
  
  root     'posts#index'  #/からの投稿一覧
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }  #投稿一覧画面
  resources :users, only: [:show, :edit, :update]
  
  resources :posts do
    resources :likes, only:[:create, :destroy]
  end
  
  get '/ranking' => 'posts#ranking'   #総合ののランキング
  
  
  resources :tools
  get 'tools/:id/ranking' => 'tools#show_ranking'   #カテゴリー別のランキング
  
  resources :comments   #commentsテーブルに関するルーティング
  
  
  
  
  post 'posts/:post_id/comments' => 'comments#create' #ネストをしないでのコメントcreate
  
  
  
  
  
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
