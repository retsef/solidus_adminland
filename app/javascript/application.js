// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import { Application, Controller } from '@hotwired/stimulus'
const application = Application.start()

import { Dropdown } from 'tailwindcss-stimulus-components'
application.register("dropdown", Dropdown)

import stimulusFlatpickr from 'stimulus-flatpickr'
application.register("flatpickr", stimulusFlatpickr)

import TomSelect from 'tom-select'

import Rails from '@rails/ujs'
import * as ActiveStorage from '@rails/activestorage'
import 'trix'
import '@rails/actiontext'

if (!window._rails_loaded) { Rails.start() }
ActiveStorage.start()

import * as Turbo from '@hotwired/turbo'

(() => {
    application.register('select', class extends Controller {
        static values = {
            options: Object,
            url: String
        }

        connect() {
            this.select = new TomSelect(this.element, {
                plugins: ['remove_button'],
                valueField: 'id',
                labelField: 'name',
                searchField: 'name',
                load: (search, callback) => {
                    let url = search ? `${this.urlValue}?q=${search}` : this.urlValue;
                    fetch(url)
                        .then(response => response.json())
                        .then(json => {
                            callback(json);
                        }).catch(() => {
                            callback();
                        });
                }
            })
        }

        disconnect() {
            this.select.destroy()
        }
    })

    application.register('nested-form', class extends Controller {
        static get targets() {
            return ["links", "template"]
        }

        connect() {
            this.wrapperClass = this.data.get("wrapperClass") || "nested-fields"
        }

        add_association(event) {
            event.preventDefault()

            var content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
            this.linksTarget.insertAdjacentHTML('beforebegin', content)
        }

        remove_association(event) {
            event.preventDefault()

            let wrapper = event.target.closest("." + this.wrapperClass)

            // New records are simply removed from the page
            if (wrapper.dataset.newRecord == "true") {
                wrapper.remove()

                // Existing records are hidden and flagged for deletion
            } else {
                wrapper.querySelector("input[name*='_destroy']").value = 1
                wrapper.style.display = 'none'
            }
        }
    })
})()