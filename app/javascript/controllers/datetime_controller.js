import { Controller } from '@hotwired/stimulus'
import flatpickr from 'flatpickr'

export default class extends Controller {
    static targets = [];
    
    fp = null;

    initialize() {
        this.config = {}
    }

    connect() {
        this.fp = flatpickr(this.element)
    }

    disconnect() {
        // const value = this.inputTarget.value
        this.fp.destroy()
        // this.inputTarget.value = value
    }
}