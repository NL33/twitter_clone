Rails.application.routes.draw do
root :to => 'tweets#index'

devise_for :users
resources :users, :only => [:show]  

resources :tweets
end
