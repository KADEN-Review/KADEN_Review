Rails.application.routes.draw do

# 会員用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
# 会員側
 
# 管理者側
 namespace :admin do
     resources :customers, only: [:index, :show, :edit, :update]
     resources :revies, only: [:index, :show]
     resources :comments, only: [:index, :show, :destroy]
     resources :home_appliances
     resources :genres, only: [:new, :create, :edit, :update]
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
