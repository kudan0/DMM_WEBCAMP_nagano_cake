Rails.application.routes.draw do
  scope module: :public do

    get "/" => "homes#top"
    get "/about" => "homes#about"
    # resources :homes, only:[:about]
    resources :items, only:[:index, :show]
    # resources :customers, only:[:confirm, :destroy]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    get "/customers/mypage" => "customers#show"
    get "/customers/mypage/edit" => "customers#edit"
    get "/customers/confirm" => "customers#confirm"
    patch "/customers/mypage" => "customers#update"
    patch "/customers/destroy" => "customers#destroy"

  end

  # deviseのルーティングをadminsからadminへ変更
  devise_for :admins,
    path: :admin,
      :controllers => {
        :registrations => 'devise/registrations',
        :sessions => 'devise/sessions',
        :passwords => 'devise/passwords'
      }
  # devise のルーティングをcustomersからpublicへ変更
  # devise_for :customers, controllers: {
  #   sessions: 'customers/sessions',
  #   passwords: 'customers/passwords',
  #   registrations: 'customers/registrations'
  # }
  devise_for :customers,
    path: :customers,
      :controllers => {
        :registrations => 'devise/registrations',
        :sessions => 'devise/sessions',
        :passwords => 'devise/passwords'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 管理側ルーティング
  namespace :admin do
    get "/admin" => "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end

end
