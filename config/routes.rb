Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  resource :projects
end
