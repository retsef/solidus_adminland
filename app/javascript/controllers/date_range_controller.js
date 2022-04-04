import { Controller } from '@hotwired/stimulus';
import { Litepicker } from 'litepicker';

export default class extends Controller {
    static targets = [];
    
    picker = null;

    initialize() {
        this.config = {
            buttonText: {
    			previousMonth: `<i class="icon ti ti-chevron-left"></i>`,
    			nextMonth: `<i class="icon ti ti-chevron-right"></i>`,
            },
            singleMode: false,
        }
    }

    connect() {
        this.picker = new Litepicker({ 
            element: this.element,
            ...this.config
        })
    }

    disconnect() {
        this.picker.destroy()
    }

}