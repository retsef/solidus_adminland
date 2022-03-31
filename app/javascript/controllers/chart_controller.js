import { Controller } from '@hotwired/stimulus';
import { merge } from 'lodash';
import ApexCharts from 'apexcharts';

export default class extends Controller {
    static targets = [];
    
    chart = null;

    initialize() {
        this.config = { }
        this.options = { }
    }

    connect() {
        this.chart = new ApexCharts(
            this.element,
            merge(this.config, this.options)
        )
    }

    disconnect() {
        this.chart.destroy()
    }

}