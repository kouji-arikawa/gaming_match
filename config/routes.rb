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

scope module: :public do
  get 'customers/my_page' => 'customers#show', as: 'my_page'
  resources :customers, only: [:edit, :update]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
