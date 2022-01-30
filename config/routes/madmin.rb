# Below are the routes for madmin
scope module: :madmin, path: :admin, as: :madmin do
  # namespace :action_text do
  #   resources :rich_texts
  # end

  # namespace :active_storage do
  #   resources :attachments
  #   resources :blobs
  #   resources :variant_records
  # end

  # namespace :action_mailbox do
  #   resources :inbound_emails
  # end

  # namespace :friendly_id do
  #   resources :slugs
  # end

  scope module: :spree, as: :spree do
    resources :payment_capture_events
    resources :zone_members
    resources :shipping_method_zones
    resources :shipping_rates
    resources :refunds
    resources :reimbursement_types

    namespace :reimbursement_type do
      resources :original_payments
      resources :store_credits
    end

    resources :store_credit_categories
    resources :store_credit_types

    resources :store_shipping_methods

    resources :orders
    resources :line_item_actions

    namespace :payment_method do
      resources :credit_cards
      resources :bogus_credit_cards
      resources :simple_bogus_credit_cards
      resources :store_credits
      resources :checks
    end

    namespace :reimbursement_type do
      resources :credits
    end

    resources :preferences
    resources :assets

    resources :stock_items
    resources :reimbursements

    resources :zones
    resources :countries
    resources :states

    resources :product_option_types

    resources :tax_categories

    resources :order_promotions

    resources :shipping_categories

    resources :variant_property_rule_values

    resources :taxons
    resources :taxonomies

    resources :adjustment_reasons

    resources :shipping_calculators

    resources :users
    resources :legacy_users

    resources :shipping_method_stock_locations

    resources :order_mutexes

    resources :variant_property_rules
    resources :option_values_variants

    resources :stores

    resources :variant_property_rule_conditions

    resources :role_users

    resources :tax_rate_tax_categories

    resources :line_items

    resources :payments

    resources :returns_calculators

    resources :products do
      resources :product_properties
      resources :images

      resources :variants

      resources :prices
    end
    resources :prices

    namespace :reimbursement_type do
      resources :exchanges
    end

    resources :addresses
    resources :user_addresses

    resources :store_credits

    resources :shipping_rate_taxes

    namespace :reimbursement do
      resources :credits
    end

    resources :shipping_method_categories

    resources :return_items
    resources :option_types

    resources :log_entries
    resources :roles

    resources :stock_locations
    resources :return_reasons

    resources :cartons

    resources :store_credit_events
    resources :credit_cards

    resources :inventory_units

    resources :customer_returns
    resources :classifications
    resources :adjustments
    resources :option_values

    # Promotion
    resources :promotion_categories
    resources :promotions do
      resources :promotion_rules
      resources :promotion_actions

      resources :promotion_codes
      resources :promotion_code_batches
    end

    # resources :product_promotion_rules
    # resources :promotion_rule_taxons
    #  resources :promotion_rule_stores
    #  resources :promotion_rule_users

    namespace :promotion do
      namespace :actions do
        resources :create_quantity_adjustments
        resources :create_item_adjustments
        resources :create_adjustments
        resources :free_shippings
      end

      namespace :rules do
        resources :users
        resources :user_roles

        resources :stores
        resources :item_totals
        resources :first_repeat_purchase_sinces
        resources :taxons
        resources :first_orders
        resources :nth_orders

        resources :products
        resources :one_use_per_users
        resources :user_logged_ins

        resources :option_values
      end
    end

    resources :properties

    resources :payment_methods
    resources :store_payment_methods
    resources :wallet_payment_sources

    resources :stock_movements

    resources :shipments

    resources :store_credit_reasons

    # Calculator
    resources :calculators
    namespace :calculator do
      resources :flat_percent_item_totals
      resources :distributed_amounts

      resources :flat_rates
      resources :flexi_rates
      resources :tiered_flat_rates
      resources :percent_on_line_items
      resources :tiered_percents
      resources :default_taxes

      namespace :shipping do
        resources :flat_percent_item_totals
        resources :price_sacks
        resources :per_items
        resources :flexi_rates
        resources :flat_rates
      end

      namespace :returns do
        resources :default_refund_amounts
      end
    end

    resources :user_stock_locations
    resources :billing_integrations

    resources :return_authorizations
    resources :tax_rates
    resources :state_changes
    resources :shipping_methods
    resources :unit_cancels
    resources :refund_reasons
  end

  root to: 'dashboard#show'
end
