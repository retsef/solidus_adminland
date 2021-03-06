Rails.application.routes.draw do
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  concern :exportable do
    get :export, on: :collection
  end

  concern :clonable do
    post :clone, on: :member
  end

  namespace :admin do
    root to: 'home#index'
    resources :search, only: :index

    # Reports
    resources :dashboards, only: %i[index show]
    resources :reports, only: %i[index show]

    # Solidus core resources
    scope module: :spree do
      # Products
      resources :products, concerns: %i[exportable clonable] do
        post :destroy_bulk, on: :collection

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
      resources :orders, except: %i[edit update], concerns: %i[exportable] do
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

          resources :payments, except: %i[destroy] do
            member do
              patch :capture
              patch :void
            end
          end

          resources :refunds
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
      resources :users, concerns: %i[exportable]

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
