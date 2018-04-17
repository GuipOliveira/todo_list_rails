Rails.application.routes.draw do
        devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do  
    authenticated :user do
      root 'homes#index', as: :authenticated_root
    end
  
    unauthenticated do
      root "devise/registrations#new", as: :unauthenticated_root
    end
  end 

    resources :collections
  delete '/collections/:id/tasks/:id', to: 'collections#destroy_task'
  get '/private_lists', to: 'collections#private_lists'
end
