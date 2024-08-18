Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :calculations, only: :create
  end
end
