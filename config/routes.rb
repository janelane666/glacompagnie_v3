Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :glacons, only: [:index, :show, :create, :destroy, :update]
        resources :users, only: [:index, :show, :create, :destroy, :update]
      end
    end
  end

  Rails.application.routes.draw do
    namespace :resources do
        resources :images
    end
  end
end
