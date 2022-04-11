import { Controller } from '@hotwired/stimulus';
import _ from 'lodash';
import Rails from '@rails/ujs';

export default class extends Controller {
  static values = {
    delay: { type: Number, default: 1000 }
  }

  lastFocusedId = null;

  initialize() {
    this.submit = this.submit.bind(this)
  }

  connect() {
    if (this.delayValue > 0) {
      this.submit = _.debounce(this.submit, this.delayValue)
    }

    document.addEventListener("turbo:request-start", this.onRequestStart.bind(this))
    document.addEventListener("turbo:load", this.onLoad.bind(this))
  }

  disconnect() {
    document.removeEventListener("turbo:request-start", this.onRequestStart.bind(this));
    document.removeEventListener("turbo:load", this.onLoad.bind(this));
  }

  submit() {
    if (!window._rails_loaded) return;

    Rails.fire(this.element, 'submit');
  }

  onRequestStart() {
    const focusedElement = document.querySelector("[data-turbo-preserve-focus]:focus");
    console.log(focusedElement);

    if (focusedElement) { this.lastFocusedId = focusedElement.id; }
  }

  onLoad() {
    console.log(this.lastFocusedId);
    if (!this.lastFocusedId) return;

    const focusedElement = document.getElementById(this.lastFocusedId);
    this.lastFocusedId = null;

    if (!focusedElement) return;

    focusedElement.focus();
  }
}
