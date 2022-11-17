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
  resources :customers, only: [:show, :edit, :update]
  resources :reviews, only: [:index, :new, :show, :create, :destroy]
  resources :comments, only: [:new]
  resources :home_appliances, only: [:index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
