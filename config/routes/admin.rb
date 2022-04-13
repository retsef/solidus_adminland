Rails.application.routes.draw do
  namespace :admin do
    root to: 'home#index'

    # Reports
    get :dashboards, to: 'dashboards#index'
    resources :reports, only: %i[index show]

    # Solidus core resources
    scope module: :spree do
      # Products
      resources :products do
        get :export, on: :collection
        post :clone, on: :member

        scope module: :product do
          resources :images
          resources :prices

          resources :variants, except: %i[show]

          resources :stock_items, only: %i[index show edit update]
        end
      end
      
      resources :variants, only: %i[index show] do
        scope module: :variant do
          resources :images
          resources :prices
          resources :stock_items, only: %i[index show edit update]
        end
      end

      # Product Properties
      resources :option_types
      resources :properties

      # Taxonomies
      resources :taxonomies do
        resources :taxons
      end

      resources :taxons

      # Orders
      resources :orders, except: %i[edit update] do
        get :export, on: :collection

        member do
          put :cancel
          put :approve
          put :resend
        end

        scope module: :order do
          resources :line_items

          resource :customer, only: %i[show edit update]
          resource :bill_address, only: %i[show edit update]
          resource :ship_address, only: %i[show edit update]

          resources :shipments, only: %i[index show edit update]
          resources :adjustments

          resources :return_authorizations
          resources :customer_returns

          resources :payments, only: %i[index show new create] do
            member do
              patch :capture
              patch :void
            end

            resources :refunds
          end

          resources :reimbursements
          resources :cancellations
        end
      end

      # Promotions
      resources :promotions do
        # resources :codes
        
        scope module: :promotion do
          resources :rules
          resources :actions
        end
      end

      resources :promotion_categories

      # Stock
      resources :stock_items, only: %i[index show edit update]
      resources :stock_locations
      resources :stock_movements

      # Users
      resources :users

      # Settings
      resources :stores

      resources :payment_methods

      resources :shipping_methods
      resources :shipping_categories

      resources :tax_categories
      resources :tax_rates

      resources :refund_reasons
      resources :reimbursement_types
      resources :return_reasons
      resources :adjustment_reasons
      resources :store_credit_reasons

      resources :zones
    end
  end
end
