// import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
// import { LightningElement,api,wire } from 'lwc';

// // import NAME_FIELD from '@salesforce/schema/Account.Name';
// // import PHONE_FIELD from '@salesforce/schema/Account.Phone';


// export default class Twolwc extends LightningElement {
// @api recordId;
// @wire(getRecord,{recordID: '$recordId', fields: ['Account.Name','Account.Phone']})
// record;
// get name(){
//     return this.record.data ? getFieldValue(this.record.data,'Account.Name'): '';

// }
// get phone(){
//     return this.record.data ? getFieldValue(this.record.data,'Account.Phone'): '';

// }

// }
import { api, LightningElement, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';

export default class DemoLWC extends LightningElement {

      @api recordId;

      @wire(getRecord, {recordId:'$recordId', fields: [NAME_FIELD, PHONE_FIELD]})
      record; 
      get name(){
        return this.record.data ? getFieldValue(this.record.data, NAME_FIELD) : '';
    }
    get phone(){

        return this.record.data ? getFieldValue(this.record.data, PHONE_FIELD) : '';
    }
}