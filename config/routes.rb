Rails.application.routes.draw do

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
# 会員用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者側
  namespace :admin do
     resources :customers, only: [:index, :show, :edit]
     patch '/customer/:id' => 'customers#update', as: 'customer_update'
     resources :reviews, only: [:show]
     delete '/review/:id' => 'reviews#destroy', as: 'review_destroy'
     resources :home_appliances, only: [:index, :new, :show, :edit]
     post '/home_appliances' => 'home_appliances#create', as: 'home_appliance_create'
     patch '/home_appliances/:id' => 'home_appliances#update', as: 'home_appliance_update'
     delete '/home_appliances/:id' => 'home_appliances#destroy', as: 'home_appliance_destroy'
     get '/search' => 'home_appliances#search', as: 'search'
     resources :genres, only: [:index, :edit, :update]
     post '/genres' => 'genres#create', as: 'genres_create'
  end

# 会員側
  root to: 'public/homes#top'
  namespace :public do
    root to: '/homes#top'
    resources :customers, only: [:show, :edit, :update]
    delete '/customers/:id' => 'customers#destroy', as: 'customer_destroy'
    get '/customer/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customer/withdraw' => 'customers#withdraw', as: 'withdraw'
    resources :reviews, only: [:index, :new, :show]
    post '/reviews' => 'reviews#create', as: 'review_create'
    delete '/customer/:id' => 'reviews#destroy', as: 'review_destroy'
    resources :home_appliances, only: [:index, :new, :show]
    post 'home_appliances' => 'home_appliances#create', as: 'home_applianc_create'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
