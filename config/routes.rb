Rails.application.routes.draw do

  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
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
     resources :customers, only: [:index, :show, :edit, :update]
     resources :reviews, only: [:index, :show]
     delete '/review/:id' => 'reviews#destroy', as: 'review_destroy'
     resources :comments, only: [:index, :show]
     delete '/comment/:id' => 'comments#destroy', as: 'comment_destroy'
     resources :home_appliances
     resources :genres, only: [:index, :create, :edit, :update]
  end

# 会員側
  root to: 'public/homes#top'
  namespace :public do
    root to: '/homes#top'
    resources :customers, only: [:index, :edit, :update]
    delete '/customers/:id' => 'customers#destroy', as: 'customer_destroy'
    get '/customer/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customer/withdraw' => 'customers#withdraw', as: 'withdraw'
    resources :reviews, only: [:index, :new, :show, :create]
    delete '/customer/:id' => 'reviews#destroy', as: 'review_destroy'
    resources :comments, only: [:new]
    resources :home_appliances, only: [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
