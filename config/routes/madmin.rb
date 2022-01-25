# Below are the routes for madmin
namespace :madmin do
  namespace :spree do
    resources :payment_capture_events
  end
  namespace :spree do
    resources :zone_members
  end
  namespace :spree do
    resources :promotion_rules
  end
  namespace :spree do
    resources :shipping_method_zones
  end
  namespace :spree do
    resources :shipping_rates
  end
  namespace :spree do
    resources :refunds
  end
  namespace :spree do
    resources :reimbursement_types
  end
  namespace :spree do
    namespace :reimbursement_type do
      resources :original_payments
    end
  end
  namespace :spree do
    namespace :reimbursement_type do
      resources :store_credits
    end
  end
  namespace :spree do
    resources :store_credit_categories
  end
  namespace :spree do
    resources :store_credit_types
  end
  namespace :spree do
    resources :store_shipping_methods
  end
  namespace :spree do
    resources :orders
  end
  namespace :spree do
    resources :line_item_actions
  end
  namespace :spree do
    namespace :payment_method do
      resources :credit_cards
    end
  end
  namespace :spree do
    namespace :payment_method do
      resources :bogus_credit_cards
    end
  end
  namespace :spree do
    namespace :payment_method do
      resources :simple_bogus_credit_cards
    end
  end
  namespace :spree do
    namespace :payment_method do
      resources :store_credits
    end
  end
  namespace :spree do
    namespace :payment_method do
      resources :checks
    end
  end
  namespace :spree do
    namespace :reimbursement_type do
      resources :credits
    end
  end
  namespace :spree do
    resources :preferences
  end
  namespace :spree do
    resources :assets
  end
  namespace :spree do
    resources :wallet_payment_sources
  end
  namespace :spree do
    resources :images
  end
  namespace :spree do
    namespace :calculator do
      resources :flexi_rates
    end
  end
  namespace :spree do
    namespace :calculator do
      resources :tiered_flat_rates
    end
  end
  namespace :spree do
    namespace :calculator do
      resources :percent_on_line_items
    end
  end
  namespace :spree do
    namespace :calculator do
      resources :tiered_percents
    end
  end
  namespace :spree do
    resources :stock_items
  end
  namespace :spree do
    resources :reimbursements
  end
  namespace :spree do
    resources :promotion_categories
  end
  namespace :spree do
    resources :zones
  end
  namespace :spree do
    resources :product_option_types
  end
  namespace :spree do
    resources :tax_categories
  end
  namespace :spree do
    resources :order_promotions
  end
  namespace :spree do
    resources :countries
  end
  namespace :spree do
    resources :product_properties
  end
  namespace :spree do
    resources :shipping_categories
  end
  namespace :action_text do
    resources :rich_texts
  end
  namespace :spree do
    resources :variant_property_rule_values
  end
  namespace :spree do
    resources :taxonomies
  end
  namespace :spree do
    resources :states
  end
  namespace :spree do
    resources :adjustment_reasons
  end
  namespace :spree do
    resources :prices
  end
  namespace :spree do
    resources :shipping_calculators
  end
  namespace :spree do
    resources :legacy_users
  end
  namespace :spree do
    resources :promotion_code_batches
  end
  namespace :spree do
    resources :product_promotion_rules
  end
  namespace :spree do
    resources :shipping_method_stock_locations
  end
  namespace :spree do
    resources :order_mutexes
  end
  namespace :spree do
    resources :promotion_actions
  end
  namespace :spree do
    resources :variant_property_rules
  end
  namespace :spree do
    resources :option_values_variants
  end
  namespace :spree do
    resources :stores
  end
  namespace :spree do
    resources :variant_property_rule_conditions
  end
  namespace :spree do
    resources :role_users
  end
  namespace :spree do
    resources :tax_rate_tax_categories
  end
  namespace :spree do
    resources :line_items
  end
  namespace :action_mailbox do
    resources :inbound_emails
  end
  namespace :spree do
    resources :payments
  end
  namespace :spree do
    namespace :calculator do
      resources :flat_percent_item_totals
    end
  end
  namespace :spree do
    namespace :calculator do
      resources :distributed_amounts
    end
  end
  namespace :friendly_id do
    resources :slugs
  end
  namespace :spree do
    namespace :calculator do
      resources :flat_rates
    end
  end
  namespace :spree do
    namespace :calculator do
      resources :default_taxes
    end
  end
  namespace :spree do
    resources :variants
  end
  namespace :spree do
    resources :products
  end
  namespace :active_storage do
    resources :blobs
  end
  namespace :spree do
    resources :promotions
  end
  namespace :spree do
    namespace :reimbursement_type do
      resources :exchanges
    end
  end
  namespace :spree do
    resources :user_addresses
  end
  namespace :spree do
    resources :promotion_rule_taxons
  end
  namespace :active_storage do
    resources :variant_records
  end
  namespace :spree do
    resources :store_credits
  end
  namespace :spree do
    resources :shipping_rate_taxes
  end
  namespace :spree do
    namespace :reimbursement do
      resources :credits
    end
  end
  namespace :active_storage do
    resources :attachments
  end
  namespace :spree do
    resources :shipping_method_categories
  end
  namespace :spree do
    resources :return_items
  end
  namespace :spree do
    resources :option_types
  end
  namespace :spree do
    resources :log_entries
  end
  namespace :spree do
    resources :roles
  end
  namespace :spree do
    namespace :promotion do
      namespace :actions do
        resources :free_shippings
      end
    end
  end
  namespace :spree do
    resources :stock_locations
  end
  namespace :spree do
    resources :return_reasons
  end
  namespace :spree do
    resources :calculators
  end
  namespace :spree do
    namespace :promotion do
      namespace :actions do
        resources :create_adjustments
      end
    end
  end
  namespace :spree do
    resources :returns_calculators
  end
  namespace :spree do
    namespace :calculator do
      namespace :returns do
        resources :default_refund_amounts
      end
    end
  end
  namespace :spree do
    namespace :promotion do
      namespace :actions do
        resources :create_item_adjustments
      end
    end
  end
  namespace :spree do
    resources :cartons
  end
  namespace :spree do
    resources :store_credit_events
  end
  namespace :spree do
    namespace :promotion do
      namespace :actions do
        resources :create_quantity_adjustments
      end
    end
  end
  namespace :spree do
    namespace :promotion do
      namespace :rules do
        resources :option_values
      end
    end
  end
  namespace :spree do
    resources :credit_cards
  end
  namespace :spree do
    namespace :promotion do
      namespace :rules do
        resources :nth_orders
      end
    end
  end
  namespace :spree do
    namespace :promotion do
      namespace :rules do
        resources :user_logged_ins
      end
    end
  end
  namespace :spree do
    namespace :promotion do
      namespace :rules do
        resources :one_use_per_users
      end
    end
  end
  namespace :spree do
    resources :inventory_units
  end
  namespace :spree do
    namespace :promotion do
      namespace :rules do
        resources :products
      end
    end
  end
  namespace :spree do
    resources :customer_returns
  end
  namespace :spree do
    namespace :promotion do
      namespace :rules do
        resources :first_orders
      end
    end
  end
  namespace :spree do
    resources :classifications
  end
  namespace :spree do
    namespace :promotion do
      namespace :rules do
        resources :taxons
      end
    end
  end
  namespace :spree do
    resources :adjustments
  end
  namespace :spree do
    namespace :promotion do
      namespace :rules do
        resources :first_repeat_purchase_sinces
      end
    end
  end
  namespace :spree do
    namespace :promotion do
      namespace :rules do
        resources :item_totals
      end
    end
  end
  namespace :spree do
    resources :option_values
  end
  namespace :spree do
    namespace :promotion do
      namespace :rules do
        resources :stores
      end
    end
  end
  namespace :spree do
    resources :properties
  end
  namespace :spree do
    resources :payment_methods
  end
  namespace :spree do
    resources :stock_movements
  end
  namespace :spree do
    namespace :promotion do
      namespace :rules do
        resources :users
      end
    end
  end
  namespace :spree do
    resources :shipments
  end
  namespace :spree do
    resources :store_credit_reasons
  end
  namespace :spree do
    namespace :promotion do
      namespace :rules do
        resources :user_roles
      end
    end
  end
  namespace :spree do
    namespace :calculator do
      namespace :shipping do
        resources :flat_percent_item_totals
      end
    end
  end
  namespace :spree do
    namespace :calculator do
      namespace :shipping do
        resources :price_sacks
      end
    end
  end
  namespace :spree do
    namespace :calculator do
      namespace :shipping do
        resources :per_items
      end
    end
  end
  namespace :spree do
    namespace :calculator do
      namespace :shipping do
        resources :flexi_rates
      end
    end
  end
  namespace :spree do
    resources :user_stock_locations
  end
  namespace :spree do
    namespace :calculator do
      namespace :shipping do
        resources :flat_rates
      end
    end
  end
  namespace :spree do
    resources :billing_integrations
  end
  namespace :spree do
    resources :return_authorizations
  end
  namespace :spree do
    resources :promotion_rule_stores
  end
  namespace :spree do
    resources :promotion_rule_users
  end
  namespace :spree do
    resources :tax_rates
  end
  namespace :spree do
    resources :state_changes
  end
  namespace :spree do
    resources :shipping_methods
  end
  namespace :spree do
    resources :unit_cancels
  end
  namespace :spree do
    resources :taxons
  end
  namespace :spree do
    resources :promotion_codes
  end
  namespace :spree do
    resources :refund_reasons
  end
  namespace :spree do
    resources :addresses
  end
  namespace :spree do
    resources :store_payment_methods
  end
  root to: "dashboard#show"
end
