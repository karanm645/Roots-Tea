Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'customers/:id/subscriptions', to: 'subscriptions#create'
      patch 'customers/:id/subscriptions/:id', to: 'subscriptions#update' 
    end
  end
end
