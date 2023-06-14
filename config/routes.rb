Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # written inside namespcae so the url will reflect properly
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :restaurants, only: [ :index, :show, :update ]
    end
  end
end
