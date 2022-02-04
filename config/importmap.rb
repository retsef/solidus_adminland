# Pin npm packages by running ./bin/importmap

pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "@hotwired/turbo", to: "turbo.min.js"

pin '@rails/actiontext', to: 'https://ga.jspm.io/npm:@rails/actiontext@7.0.1/app/javascript/actiontext/index.js'
pin '@rails/activestorage', to: 'https://ga.jspm.io/npm:@rails/activestorage@7.0.1/app/assets/javascripts/activestorage.esm.js'
pin '@rails/ujs', to: 'https://ga.jspm.io/npm:@rails/ujs@7.0.1/lib/assets/compiled/rails-ujs.js'

pin 'trix', to: 'https://ga.jspm.io/npm:trix@2.0.0-alpha.0/dist/trix.js'

# pin 'tom-select', to: 'https://ga.jspm.io/npm:tom-select@2.0.0/dist/js/tom-select.complete.js'
# pin 'tailwindcss-stimulus-components', to: 'https://ga.jspm.io/npm:tailwindcss-stimulus-components@3.0.2/dist/tailwindcss-stimulus-components.modern.js'

pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.1.3/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.2/dist/esm/index.js"

pin "choices.js", to: "https://ga.jspm.io/npm:choices.js@10.0.0/public/assets/scripts/choices.js"

# ???
# pin 'stimulus-flatpickr', to: 'https://ga.jspm.io/npm:stimulus-flatpickr@1.4.0/dist/index.js'
# pin 'flatpickr', to: 'https://ga.jspm.io/npm:flatpickr@4.6.9/dist/flatpickr.js'

pin_all_from "app/javascript/controllers", under: "controllers"

pin 'application'
