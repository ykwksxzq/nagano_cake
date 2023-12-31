Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  get '/admin' => 'admin/homes#top'

  get '/customers/mypage' => 'public/customers#show'
  get '/customers/information/edit' => 'public/customers#edit'
  patch '/customers/information' => 'public/customers#update'

  get '/customers/check' => 'public/customers#check'
  patch '/customers/withdraw' => 'public/customers#withdraw'

  delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'

  post '/orders/confirm' => 'public/orders#confirm'
  get '/orders/complete' => 'public/orders#complete'

  scope module: 'public' do
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy]
  resources :orders, only: [:new, :index, :show, :create]
  end

  namespace :admin do
   resources :items, :customers
   resources :orders, only:[:show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
