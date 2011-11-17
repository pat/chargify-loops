Rails.application.routes.draw do
  namespace :chargify do
    resources :hooks
  end
end
