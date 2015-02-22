Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users' }
  root "projects#index"
  resources :projects
  get '/register' => "users#new"
  devise_scope :user do 
    get "/login" => "devise/sessions#new"
  end
  resources :users
end
