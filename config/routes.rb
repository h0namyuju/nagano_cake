Rails.application.routes.draw do

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  root to: 'public/homes#top'

  namespace :admin do
    get 'homes/top'
    get 'orders/show'
    resources :customers, only:[:index, :show, :edit]
    resources :genres, only:[:index, :edit, :create, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
  end

  namespace :public do
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :orders, only:[:new, :index, :show]
    resources :cart_items, only:[:index,  :create, :update, :destroy]
    resources :customers, only:[:show, :edit]
    resources :items, only:[:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
