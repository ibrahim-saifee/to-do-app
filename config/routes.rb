Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :tasks, only: [:create, :update, :destroy] do
    collection do
      patch :update_position
    end
  end
end
