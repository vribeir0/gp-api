Rails.application.routes.draw do
  namespace :api do  
    resource :users, only: :create
  end
end
