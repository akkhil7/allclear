# == Route Map
#
#               Prefix Verb   URI Pattern                    Controller#Action
#     new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#         user_session POST   /users/sign_in(.:format)       devise/sessions#create
# destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#        user_password POST   /users/password(.:format)      devise/passwords#create
#    new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#   edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                      PATCH  /users/password(.:format)      devise/passwords#update
#                      PUT    /users/password(.:format)      devise/passwords#update
#             projects GET    /projects(.:format)            projects#index
#                      POST   /projects(.:format)            projects#create
#          new_project GET    /projects/new(.:format)        projects#new
#         edit_project GET    /projects/:id/edit(.:format)   projects#edit
#              project GET    /projects/:id(.:format)        projects#show
#                      PATCH  /projects/:id(.:format)        projects#update
#                      PUT    /projects/:id(.:format)        projects#update
#                      DELETE /projects/:id(.:format)        projects#destroy
#                teams GET    /teams(.:format)               teams#index
#                 team PATCH  /teams/:id(.:format)           teams#update
#                      PUT    /teams/:id(.:format)           teams#update
#                      DELETE /teams/:id(.:format)           teams#destroy
#                login GET    /login(.:format)               devise/sessions#new
#             me_users GET    /users/me(.:format)            users#me
#                users GET    /users(.:format)               users#index
#                      POST   /users(.:format)               users#create
#             new_user GET    /users/new(.:format)           users#new
#            edit_user GET    /users/:id/edit(.:format)      users#edit
#                 user GET    /users/:id(.:format)           users#show
#                      PATCH  /users/:id(.:format)           users#update
#                      PUT    /users/:id(.:format)           users#update
#                      DELETE /users/:id(.:format)           users#destroy
#

Rails.application.routes.draw do
  resources :posts

  devise_for :users, :controllers => { :registrations => 'users' }

  resources :projects, only: [:index, :create, :update, :show, :destroy]
  resources :teams, only: [:index, :create, :update, :show, :destroy] do
    collection do
      get :my_team
    end
  end

  resources :issues, only: [:index, :create, :show, :update, :destroy] do
    member do
      resources :comments
    end
  end


  devise_scope :user do
    get "/login" => "devise/sessions#new"
  end

  resources :users do
    collection do
      get :me
      get :token
    end
  end
end
