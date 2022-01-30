Rails.application.routes.draw do
  namespace :admin do
    scope module: :spree, as: :spree do
      # resources :users

      resources :products do
        scope module: :product do

        end
      end

      resources :orders do
        scope module: :order do

        end
      end
    end
  end
end