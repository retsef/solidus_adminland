import { Controller } from '@hotwired/stimulus';
import MiniMasonry from 'minimasonry';

export default class extends Controller {
    static targets = [];
    static values = {

    }

    mansonry = null;

    connect() {
        this.mansonry = new MiniMasonry({
            container: this.element,
            wedge: true
        });
    }

    disconnect() {
        if(this.mansonry) this.mansonry.destroy();
    }
}
