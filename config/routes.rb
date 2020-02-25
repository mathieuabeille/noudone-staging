Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :flows , defaults: { format: :json }, only: [:index] do
          resources :ratings , only: [:index]
          resources :tasks , only: [:index] do
          end
        end
      resources :users , defaults: { format: :json } do
        resources :flows do
          resources :ratings
          resources :tasks do
            resources :videos
            resources :checklists
            resources :forms
            resources :images
            resources :batches do
              resources :interactions
            end
          end
        end
      end
    end
  end
  root to: 'users#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
