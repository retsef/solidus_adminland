# Pin npm packages by running ./bin/importmap

pin 'admin'
pin_all_from 'app/javascript/admin/controllers', under: 'admin/controllers'
pin_all_from 'app/javascript/admin/helpers', under: 'admin/helpers'

pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin '@hotwired/turbo', to: 'turbo.min.js'

pin '@rails/actiontext', to: 'https://ga.jspm.io/npm:@rails/actiontext@6.1.5/app/javascript/actiontext/index.js'
pin '@rails/activestorage', to: 'https://ga.jspm.io/npm:@rails/activestorage@6.1.5/app/assets/javascripts/activestorage.js'
pin '@rails/ujs', to: 'https://ga.jspm.io/npm:@rails/ujs@6.1.5/lib/assets/compiled/rails-ujs.js'

pin 'trix', to: 'https://ga.jspm.io/npm:trix@2.0.0-alpha.1/dist/trix.js'

# pin 'tom-select', to: 'https://ga.jspm.io/npm:tom-select@2.0.0/dist/js/tom-select.complete.js'
# pin 'tailwindcss-stimulus-components', to: 'https://ga.jspm.io/npm:tailwindcss-stimulus-components@3.0.2/dist/tailwindcss-stimulus-components.modern.js'

pin 'bootstrap', to: 'https://ga.jspm.io/npm:bootstrap@5.1.3/dist/js/bootstrap.esm.js'
pin '@popperjs/core', to: 'https://ga.jspm.io/npm:@popperjs/core@2.11.2/dist/esm/index.js'

pin 'choices.js', to: 'https://ga.jspm.io/npm:choices.js@9.0.1/public/assets/scripts/choices.js'
pin 'tom-select', to: 'https://ga.jspm.io/npm:tom-select@2.0.1/dist/js/tom-select.complete.js'

pin 'flatpickr', to: 'https://ga.jspm.io/npm:flatpickr@4.6.9/dist/flatpickr.js'
pin 'litepicker', to: 'https://ga.jspm.io/npm:litepicker@2.0.12/dist/litepicker.umd.js'
# pin 'inputmask', to: 'https://ga.jspm.io/npm:inputmask@5.0.7/dist/inputmask.js'

pin 'local-time-cdn', to: 'https://ga.jspm.io/npm:local-time@2.1.0/app/assets/javascripts/local-time.js'
pin 'lodash', to: 'https://ga.jspm.io/npm:lodash@4.17.21/lodash.js'

pin 'apexcharts', to: 'https://ga.jspm.io/npm:apexcharts@3.33.2/dist/apexcharts.common.js'

pin "minimasonry", to: "https://ga.jspm.io/npm:minimasonry@1.3.0/build/minimasonry.esm.js"
