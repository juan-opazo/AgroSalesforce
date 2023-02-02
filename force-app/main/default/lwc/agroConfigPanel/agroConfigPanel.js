import { LightningElement, wire } from 'lwc';
import SLDS_ICONS from '@salesforce/resourceUrl/SLDS_Icons';
import { refreshApex } from '@salesforce/apex';
import getSAEmailParams from '@salesforce/apex/SoilAnalysisController.getSAEmailParams';

export default class AgroConfigPanel extends LightningElement {
    currentRotation = 0;
    refreshIcon = `${SLDS_ICONS}/refresh.svg`;
    refreshButtonClass = `slds-button slds-button_icon rotate-when-active`;
    wiredData;
    saEmailParams;

    @wire(getSAEmailParams)
    wiredCustomMetadata(result) {
        this.wiredData = result;
        if (result.data) {
            this.saEmailParams = result.data;
            console.log(result.data);
        } else {
            console.error(result.error);
        }
    }

    handleRefresh() {
        this.currentRotation += 360;
        this.template.querySelector('.rotate-when-active').style.transform = `rotate(${this.currentRotation}deg)`;
        refreshApex(this.wiredData);
    }
}