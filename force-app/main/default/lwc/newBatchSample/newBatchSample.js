import { LightningElement } from 'lwc';

export default class NewBatchSample extends LightningElement {
    handleClick(event) {
        executeBatch();
    }
}