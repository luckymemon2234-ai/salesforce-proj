import { LightningElement, wire, api, track } from "lwc";
import getAccount from "@salesforce/apex/opptySrch.getAccount";
import ACCOUNTID_FIELD from '@salesforce/schema/Opportunity.AccountId';
import {getRecord,getFieldValue} from 'lightning/uiRecordApi';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';
 
const COLUMNS = [   
    { label: 'Name', fieldName: 'Name' },
    { label: 'Email', fieldName: 'Email' }
]
// const COLUMNS2 = [   
//   { label: 'Name', fieldName: 'Name' },
//   { label: 'AccountId', fieldName: 'AccountId' }
// ]

export default class LwcOppotyAcc extends LightningElement {
    
  //   @track accName;
  //  ac ='0015g000013tnwjAAA';
   
  //   @track records;
  //   @track error;
  //   @api recordId;
    
  //   @wire(getRecord,{recordId : '$recordId', fields: [ACCOUNTID_FIELD]})
  //   record;
   // ac = getFieldValue(this.record.data, ACCOUNTID_FIELD);
    // get name(){
    //     return this.record.data ? getFieldValue(this.record.data, ACCOUNTID_FIELD) : '';
      
      
    // }
  //   get name() {
  //     return this.contact.data.fields.Name.value;
  // }

  //  ac = getFieldValue(this.record.data, ACCOUNTID_FIELD);
  
  
       
    // @wire (getAccount,{searchId:'$ac'})
    // wiredAccount({error,data}){
       
    //         this.records=data;
        
        
    // } 
    @api recordId;
    recordCount;
    records;
    columns = COLUMNS;
   
    // recordCount2;
    // records2;
    // columns2 = COLUMNS2;
    
    

    @wire( getRelatedListRecords, {

        parentRecordId: '$recordId',
        relatedListId: 'Contacts',
        fields: [ 'Contact.Id', 'Contact.Name', 'Contact.Email' ]

    } )listInfo( { error, data } ) {

        if ( data ) {

            console.log( 'Data is', JSON.stringify( data ) );
            let tempRecords = [];

            data.records.forEach( obj => {

                console.log( 'obj is', JSON.stringify( obj ) );
                let tempRecord = {};
                tempRecord.Id = obj.fields.Id.value;
                tempRecord.Name = obj.fields.Name.value;
                tempRecord.Email = obj.fields.Email.value;
                tempRecords.push( tempRecord );

            } );

            this.records = tempRecords;
            this.recordCount = data.count;
            console.log( 'Records are ' + JSON.stringify( this.records ) );
            
        } else if (error) {
            
            this.records = undefined;

        }
    }

  //   @wire( getRelatedListRecords, {

  //     parentRecordId: '$recordId',
  //     relatedListId: 'Opportunities',
  //     fields: [ 'Opportunity.Id', 'Opportunity.Name', 'Opportunity.StageName' ]

  // } )listInfo( { error, data } ) {

  //     if ( data ) {

  //         console.log( 'Data is', JSON.stringify( data ) );
  //         let tempRecords = [];

  //         data.records2.forEach( obj => {

  //             console.log( 'obj is', JSON.stringify( obj ) );
  //             let tempRecord = {};
  //             tempRecord.Id = obj.fields.Id.value;
  //             tempRecord.Name = obj.fields.Name.value;
  //             tempRecord.StageName = obj.fields.Email.StageName;
  //             tempRecords.push( tempRecord );

  //         } );

  //         this.records2 = tempRecords;
  //         this.recordCount2 = data.count;
  //         console.log( 'Records are ' + JSON.stringify( this.records2 ) );
          
  //     } else if (error) {
          
  //         this.records2 = undefined;

  //     }
  // }
}