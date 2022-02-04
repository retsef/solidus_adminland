import { Controller } from '@hotwired/stimulus'
import Choices from 'choices.js'

export default class extends Controller {
    static targets = [];
    
    choices = null;

    initialize() {
        this.config = {}
    }

    connect() {
        this.choices = Choices(this.element, {
            ...this.config
        })
    }

    disconnect() {
        // const value = this.inputTarget.value
        this.choices.destroy()
        // this.inputTarget.value = value
    }
}