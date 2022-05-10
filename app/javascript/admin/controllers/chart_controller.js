import { Controller } from '@hotwired/stimulus';
import ApexCharts from 'apexcharts';
import _ from 'lodash';

export default class extends Controller {
    static targets = [];
    static values = {
        options: { type: Object, default: {} }
    };
    
    chart = null;

    initialize() {
        this.config = {
            chart: {
                height: 240,
                fontFamily: 'inherit',
                parentHeightOffset: 0,
                zoom: {
                    enabled: false
                },
                toolbar: {
                    show: false
                },
                animations: {
                    enabled: false
                },
                sparkline: {
                    enabled: false,
                }
            },
            dataLabels: {
                enabled: false
            },
            fill: {
                opacity: 1
            },
            grid: {
                strokeDashArray: 4,
                xaxis: {
                    lines: {
                        show: true
                    }
                }
            },
            xaxis: {
                tooltip: {
                    enabled: false
                }
            },
            yaxis: {
                tooltip: {
                    enabled: false
                }
            }
        };
    }

    connect() {
        console.log(this.optionsValue);

        this.chart = new ApexCharts(
            this.element,
            _.merge(this.config, this.optionsValue)
        )

        this.chart.render();
    }

    disconnect() {
        this.chart.destroy()
    }
}
