FootballRails::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    delete "logout", to: "devise/sessions#destroy"
    get "signup", to: "devise/registrations#new"
  end

  resources :teams

  resources :seasons do
    resources :weeks do
      get 'picks', to: "picks#index"
      resources :matches do
        resources :picks do #without picks#index
        end
      end
    end
  end

  root to: 'seasons#index'
end
