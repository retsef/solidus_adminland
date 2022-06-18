import { Controller } from '@hotwired/stimulus';
import MiniMasonry from 'minimasonry';
// import 'masonry-layout';

export default class extends Controller {
    static targets = ['item'];
    static values = {

    }

    mansonry = null;

    connect() {
        // return;

        this.itemTargets.forEach(item => {
            item.classList.add('position-absolute');
        });
        
        this.mansonry = new MiniMasonry({
            container: this.element,
            baseWidth: 320,
            gutterX: 0,
            gutterY: 12,
            minify: true,
            wedge: true
        });
    }

    disconnect() {
        if(this.mansonry) this.mansonry.destroy();

        this.itemTargets.forEach(item => {
            item.classList.remove('position-absolute');
        });
    }
}
