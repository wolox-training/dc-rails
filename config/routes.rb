Rails.application.routes.draw do
  devise_for :users
  get 'main_controller/index'
  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Heroku
  # API Endpoints
  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
      resources :users do
        member do
          get 'rents' => "users#rents_index"
          post 'rents' => "rents#create"
        end
        collection do
          resources :sessions, only: [:create] do
              collection do
                post :renew
                post :invalidate_all
              end
          end
        end
      end

      resources :books, only: [:index, :show]

  end
  # ...
end
