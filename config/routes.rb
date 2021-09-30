Rails.application.routes.draw do
  # deviseのルーティングをadminsからadminへ変更
  devise_for :admins,
    path: :admin,
      :controllers => {
        :registrations => 'devise/registrations',
        :sessions => 'devise/sessions',
        :passwords => 'devise/passwords'
      }

  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 管理側ルーティング
  namespace :admin do
    get "/" => "homes#top"
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :order_items, only:[:update]
  end

end
