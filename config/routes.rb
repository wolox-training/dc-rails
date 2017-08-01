Rails.application.routes.draw do
  devise_for :users
  get 'main_controller/index'
  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
