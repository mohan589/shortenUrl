Rails.application.routes.draw do
  resources :api_shortners
  root :to => 'api_shortners#index'
end
