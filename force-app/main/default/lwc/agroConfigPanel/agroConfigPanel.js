import { LightningElement, wire } from 'lwc';
import getSAEmailParams from '@salesforce/apex/SoilAnalysisController.getSAEmailParams';
import updateSAEmailParams from '@salesforce/apex/SoilAnalysisController.updateSAEmailParams';

export default class AgroConfigPanel extends LightningElement {
    saEmailParams;

    @wire(getSAEmailParams)
    wiredCustomMetadata({ err, data }) {
        if (data) {
            this.saEmailParams = data;
            let checkboxSASendEmail = this.template.querySelector('[data-id="checkbox-SA-send-email"]');
            checkboxSASendEmail.checked = this.saEmailParams.isActive;
            console.log(data);
        } else {
            console.error(err);
        }
    } 
    handleActivateEmailSending(event) {
        let checkboxSASendEmail = this.template.querySelector('[data-id="checkbox-SA-send-email"]');
        checkboxSASendEmail.checked = event.target.checked;
    }
    updateSAEmailParams(event) {
        updateSAEmailParams(this.saEmailParams);
    }
}