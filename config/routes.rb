Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :hello, only: %i[index]
      resources :wishes, only: %i[index create update]
    end
  end
end
