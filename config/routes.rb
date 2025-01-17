Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations'}
  devise_scope :user do
    get 'sign_in', to: "devise/sessions#new"
    get 'sign_up', to: "devise/registrations#new"
  end

  resources :leads
  resources :sales_proposals

  root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
