import { LightningElement } from 'lwc';
import getOppPopularity from '@salesforce/apex/OpportunityController.getOppPopularity';

import { loadScript } from 'lightning/platformResourceLoader';

import chartjs from '@salesforce/resourceUrl/chart';

const COLORS = ['green','blue','lightgreen','yellow','violet','orange','indigo','pink','lightblue','red'];

const CHART_CONFIG = {
    dom_selector: 'canvas.certBarChart',
    type: 'doughnut',
    color:  COLORS, //'rgb(255, 99, 132)', we can use this also in the place of COLORS
    label: 'Cert Popularity',
    options: {
        responsive: true,
        legend: { display: false },
        title: { display: false },
        animation: {
            animateScale: true
        }
    }
}


export default class CertPopularity extends LightningElement {
    error;
    _chart;
    _chartjsInitialized = false;
    renderedCallback() {

        if (this._chartjsInitialized) {
            return;
        }
        this._chartjsInitialized = true;
		
		
        loadScript(this, chartjs)
            .then(getOppPopularity)
            .then((result) => {
                console.log('Data returned from Apex', result);
                let oppData = result;
                let oppLabels = [];
                let oppCounts = [];
                for (let i = 0; i < oppData.length; i++) {
                     oppLabels.push(oppData[i].CloseDate);
                     oppCounts.push(oppData[i].Amount);
                     console.log(JSON.stringify(oppData));
                }
                const config = {
                    type: CHART_CONFIG.type,
                    data: {
                        labels: oppLabels,
                        datasets: [{
                            label: CHART_CONFIG.label,
                            backgroundColor: CHART_CONFIG.color,
                            data: oppCounts
                        }]
                    },
                    options: CHART_CONFIG.options
                };
                const ctx = this.template
                    .querySelector(CHART_CONFIG.dom_selector)
                    .getContext('2d');
                this._chart = new window.Chart(ctx, config);
            })
            .catch(error => {
                this.error = error;
            });
    }
}