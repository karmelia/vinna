Rails.application.routes.draw do
  root 'posts#index'

  get 'about', to: 'about#index'

  resources :posts
  resources :users

  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out

  #              Prefix Verb         URI Pattern                     Controller#Action
  #         new_admin_session GET    /admins/sign_in(.:format)       devise/sessions#new
  #             admin_session POST   /admins/sign_in(.:format)       devise/sessions#create
  #     destroy_admin_session DELETE /admins/sign_out(.:format)      devise/sessions#destroy
  #            admin_password POST   /admins/password(.:format)      devise/passwords#create
  #        new_admin_password GET    /admins/password/new(.:format)  devise/passwords#new
  #       edit_admin_password GET    /admins/password/edit(.:format) devise/passwords#edit
  #                           PATCH  /admins/password(.:format)      devise/passwords#update
  #                           PUT    /admins/password(.:format)      devise/passwords#update
  # cancel_admin_registration GET    /admins/cancel(.:format)        devise/registrations#cancel
  #        admin_registration POST   /admins(.:format)               devise/registrations#create
  #    new_admin_registration GET    /admins/sign_up(.:format)       devise/registrations#new
  #   edit_admin_registration GET    /admins/edit(.:format)          devise/registrations#edit
  #                           PATCH  /admins(.:format)               devise/registrations#update
  #                           PUT    /admins(.:format)               devise/registrations#update
  #                           DELETE /admins(.:format)               devise/registrations#destroy
  #          new_user_session GET    /users/sign_in(.:format)        devise/sessions#new
  #              user_session POST   /users/sign_in(.:format)        devise/sessions#create
  #      destroy_user_session DELETE /users/sign_out(.:format)       devise/sessions#destroy
  #             user_password POST   /users/password(.:format)       devise/passwords#create
  #         new_user_password GET    /users/password/new(.:format)   devise/passwords#new
  #        edit_user_password GET    /users/password/edit(.:format)  devise/passwords#edit
  #                           PATCH  /users/password(.:format)       devise/passwords#update
  #                           PUT    /users/password(.:format)       devise/passwords#update
  #  cancel_user_registration GET    /users/cancel(.:format)         devise/registrations#cancel
  #         user_registration POST   /users(.:format)                devise/registrations#create
  #     new_user_registration GET    /users/sign_up(.:format)        devise/registrations#new
  #    edit_user_registration GET    /users/edit(.:format)           devise/registrations#edit
  #                           PATCH  /users(.:format)                devise/registrations#update
  #                           PUT    /users(.:format)                devise/registrations#update
  #                           DELETE /users(.:format)                devise/registrations#destroy
  #                      root GET    /                               posts#index
  #                     about GET    /about(.:format)                about#index
  #                     posts GET    /posts(.:format)                posts#index
  #                           POST   /posts(.:format)                posts#create
  #                  new_post GET    /posts/new(.:format)            posts#new
  #                 edit_post GET    /posts/:id/edit(.:format)       posts#edit
  #                      post GET    /posts/:id(.:format)            posts#show
  #                           PATCH  /posts/:id(.:format)            posts#update
  #                           PUT    /posts/:id(.:format)            posts#update
  #                           DELETE /posts/:id(.:format)            posts#destroy

end
