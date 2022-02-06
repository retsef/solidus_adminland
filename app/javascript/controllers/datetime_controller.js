import { Controller } from '@hotwired/stimulus'
import flatpickr from 'flatpickr'

export default class extends Controller {
    static targets = [];
    
    fp = null;

    initialize() {
        this.config = {}
    }

    connect() {
        this.fp = flatpickr(this.element, {
            ...this.config,
            enableTime: this.enableTime
        })
    }

    get enableTime() {
        return this.element.dataset.type == 'datetime';
    }

    disconnect() {
        this.fp.destroy()
    }
}