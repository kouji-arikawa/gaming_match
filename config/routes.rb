Rails.application.routes.draw do
  #管理者用
  devise_for :admins, skip: [:registrations, :passwords],controllers: {
    sessions: "admin/sessions"
  }

  #会員用
  devise_for :customers, skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

devise_scope :customer do
  post 'customer/guest_sign_in', to: 'public/sessions#guest_sign_in'
end

scope module: :public do
  root to: 'homes#top'
  get 'customers/my_page' => 'customers#show', as: 'my_page'
  resources :customers, only: [:edit, :update]
  resources :contributions, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :customer_contributions, only: [:create, :destroy] do
    member do
      post :change_status
    end
  end
end

namespace :admin do
  # root to: 'homes#top'
  resources :genres, only: [:index, :create, :edit, :update]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
