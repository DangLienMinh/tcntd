Rails.application.routes.draw do


  #get 'menus/show'


  mount Ckeditor::Engine => '/ckeditor'

  get 'posts/show'
  get 'posts/showalltintuc'
  get 'posts/showalltuyensinh'
  get 'posts/showalltuyendung'
  get 'posts/showallthongbao'
  get 'home/contact'
  # post 'admin/login' => 'sessions#create'
  # get 'admin/login' => 'sessions#create'
ActiveAdmin.routes(self)
  #devise_for :admin_users do get '/amdin/login' => 'sessions#create' end
    
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  get 'home/index'

  resources :home
  resources :categories
  resources :contacts
  resources :menus , path: 'trang'

  get '/*id', to: 'posts#show', as: :post


  get 'tin-tuc/index'
  resources :pages, path: 'trang'
  
  root 'home#index'

end
