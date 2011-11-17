Rails.application.routes.draw do
  namespace :chargify do
    resources :hooks, :only => :create
  end
end
