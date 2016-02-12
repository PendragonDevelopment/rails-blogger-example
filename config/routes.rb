# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                  authors GET    /authors(.:format)             authors#index
#                          POST   /authors(.:format)             authors#create
#               new_author GET    /authors/new(.:format)         authors#new
#              edit_author GET    /authors/:id/edit(.:format)    authors#edit
#                   author GET    /authors/:id(.:format)         authors#show
#                          PATCH  /authors/:id(.:format)         authors#update
#                          PUT    /authors/:id(.:format)         authors#update
#                          DELETE /authors/:id(.:format)         authors#destroy
#                     root GET    /                              articles#index
#                 articles GET    /articles(.:format)            articles#index
#                          POST   /articles(.:format)            articles#create
#              new_article GET    /articles/new(.:format)        articles#new
#             edit_article GET    /articles/:id/edit(.:format)   articles#edit
#                  article GET    /articles/:id(.:format)        articles#show
#                          PATCH  /articles/:id(.:format)        articles#update
#                          PUT    /articles/:id(.:format)        articles#update
#                          DELETE /articles/:id(.:format)        articles#destroy
#                     tags GET    /tags(.:format)                tags#index
#                          POST   /tags(.:format)                tags#create
#                  new_tag GET    /tags/new(.:format)            tags#new
#                 edit_tag GET    /tags/:id/edit(.:format)       tags#edit
#                      tag GET    /tags/:id(.:format)            tags#show
#                          PATCH  /tags/:id(.:format)            tags#update
#                          PUT    /tags/:id(.:format)            tags#update
#                          DELETE /tags/:id(.:format)            tags#destroy
#

Rails.application.routes.draw do
  devise_for :users
  resources :authors
  root to: 'articles#index'
  resources :articles
  resources :tags
end

