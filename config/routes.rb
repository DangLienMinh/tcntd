Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  get 'contacts/new'
  get 'contacts/aa'


  get 'posts/show'
  get 'posts/showalltintuc'
  get 'posts/showalltuyensinh'
  get 'posts/showalltuyendung'
  get 'posts/showallthongbao'
  get 'home/contact'
  get 'pages/gioithieu'

  get 'pages/lienhe'

  get 'pages/thungo'

  get 'pages/csvc'

  get 'pages/kiemdinh'
ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  get 'home/index'

  # get 'posts/new'

  # get 'posts/edit'

  # get 'posts/create'

  # get 'posts/update'

  # get 'posts/show'

  # get 'posts/destroy'

  # get 'posts/index'

  # get 'categories/new'

  # get 'categories/edit'

  # get 'categories/create'

  # get 'categories/update'

  # get 'categories/show'

  # get 'categories/destroy'

  # get 'categories/index'

  # get 'departments/new'

  # get 'departments/edit'

  # get 'departments/create'

  # get 'departments/update'

  # get 'departments/show', param: :name
  

  # get 'departments/destroy'

  get 'departments/index'
  resources :home
  resources :categories
  resources :contacts
  #resources :posts,path: 'tin-tuc'
  get '/tin-tuc/*id', to: 'posts#show', as: :post
  #get 'tin-tuc/new', to: 'posts#new', as: :post

  get 'tin-tuc/index'
  resources :departments, path: 'phong-ban'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
