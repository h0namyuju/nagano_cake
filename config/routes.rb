Rails.application.routes.draw do
  namespace :public do
    get 'shipings/index'
    get 'shipings/edit'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    resources :customer, only:[:index, :show, :edit]
  end
  namespace :admin do
    resources :genres, only:[:index, :edit, :create, :update]
  end
  namespace :admin do
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
  end
  namespace :admin do
    get 'homes/top'
  end
  # 顧客用
  # URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
root to: 'public/homes#top'

  # 管理者用
  # URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
