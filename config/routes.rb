Rails.application.routes.draw do
  root "home#index"
  resource :tasks
  get "/payment" => "home#new"
  get "/maps" => "home#edit"

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers:{ sessions: 'api/v1/users/sessions', registrations: 'api/v1/users/registrations' }
    end
  end

end
