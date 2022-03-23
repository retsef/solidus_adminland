import { Controller } from '@hotwired/stimulus';
import flatpickr from 'flatpickr';

export default class extends Controller {
    static targets = [];
    
    picker = null;

    initialize() {
        this.config = {}
    }

    connect() {
        this.picker = flatpickr(this.element, {
            ...this.config,
            enableTime: this.enableTime
        })
    }

    disconnect() {
        this.picker.destroy()
    }

}