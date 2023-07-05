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
  patch 'customers/withdraw' => 'public/customers#withdraw'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
