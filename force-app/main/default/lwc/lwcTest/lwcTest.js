import { LightningElement,api,wire,track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import opptyfetch from '@salesforce/apex/lwcTestC.opptyfetch';
import FIRSTNAME_FIELD from '@salesforce/schema/Opportunity.AccountId';
import ACCOUNT_ID from '@salesforce/schema/Opportunity.AccountId';
import opptyContactfetch from '@salesforce/apex/lwcTestC.opptyContactfetch'
import CONTACT_ID_FIELD from '@salesforce/schema/Opportunity.ContactId';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import ISP_FIELD from '@salesforce/schema/Contact.Name';
const columns = [
    {
        label: 'Account Name',
        fieldName: 'accountName',
        type: 'text'
    },
    {
      label: 'Account Id',
      fieldName: 'accountId',
     
  },{
    label: 'contact Id',
    fieldName: 'ContactId'
  }
  ];
 const  gridColumns =[ 
  {
    label: 'contact Name',
    fieldName: 'Name',
    type: 'text',
    editable: true,
}
,
{
  label: 'Contact Id',
  fieldName: 'Id',
  
 
},
{ label: 'Is primary',
fieldName: 'isPrimary' ,
editable: true,
type: 'checkbox'
}
//,
// {
// label: 'Contact Phone',
// fieldName: 'Phone',

// }
];

export default class LwcTest extends LightningElement {
  accoundId;
  saveDraftValues = [];
  fldsItemValues = [];
  draftValues = [];
    @api recordId
    @track data;
    @track columns=columns;
   @track myId;
   @track gridData;
   @track gridColumns = gridColumns;
   @track saveDraftValues;
    error;
    // @wire(opptyfetch,  { fieldApiName: FIRSTNAME_FIELD })
    // salutationValues;
    // accAcount({ recId: this.aId })
    // .then((result) => {
    //     this.accounts = result;
    //     this.error = undefined;
    // })
    // connectedCallback(){

    // }
   

    @wire(opptyfetch, { recId: '$recordId' })
    myAccounts(result){
      console.log("temp>s>:"+JSON.stringify(result.error))
      if(result.data){
        console.log('wroking2')
        this.data = result.data.map(row=>{
            return{...row,accountName: row.Account.Name ,accountId: row.AccountId ,ContactId : row.ContactId,contactPhone: row.contactPhone }
        })
        this.error = undefined; }
        else if(result.error){
          this.error=result.error;
          this.data =undefined;
          console.log('not wroking')
          console.log("temp>>:"+JSON.stringify(this.recordId))

       
      }}
      @wire (opptyContactfetch ,{ recId: '$recordId'})
      myContacts(result)  {
        // this.contacts = result;
        // this.error = undefined;
        console.log('not working 66');
        if(result.data){
          console.log('fomewroking66')
          this.gridData= result.data.map(row=>{
              return{...row,Name: row.Contact.Name, Id: row.Id , isPrimary : row.IsPrimary}
        })
    }}
    handleSave(event) {
      this.saveDraftValues = event.detail.draftValues;
      const recordInputs = this.saveDraftValues.slice().map(draft => {
          const fields = Object.assign({}, draft);
          return { fields };
      });

      // Updateing the records using the UiRecordAPi
      const promises = recordInputs.map(recordInput => updateRecord(recordInput));
      Promise.all(promises).then(res => {
          this.dispatchEvent(
              new ShowToastEvent({
                  title: 'Success',
                  message: 'Records Updated Successfully!!',
                  variant: 'success'
              })
          );
          this.saveDraftValues = [];
          return this.refresh();
      }).catch(error => {
          this.dispatchEvent(
              new ShowToastEvent({
                  title: 'Error',
                  message: 'An Error Occured!!',
                  variant: 'error'
              })
          );
      }).finally(() => {
          this.saveDraftValues = [];
      });
  }

  // This function is used to refresh the table once data updated
  async refresh() {
      await refreshApex(this.gridData);
  }
  //   handleSave(event) {
  //     this.saveDraftValues = event.detail.draftValues;
  //     console.log('btn clicked1');
  //     const recordInputs = this.saveDraftValues.slice().map(draft => {
  //         const fields = Object.assign({}, draft);
  //         return { fields };
          
  //     });

  //     // Updateing the records using the UiRecordAPi
  //     const promises = recordInputs.map(recordInput => updateRecord(recordInput));
  //     Promise.all(promises).then(res => {
  //         this.ShowToast('Success', 'Records Updated Successfully!', 'success', 'dismissable');
  //         this.saveDraftValues = [];
  //         return this.refresh();
  //     }).catch(error => {
  //         this.ShowToast('Error', 'An Error Occured!!', 'error', 'dismissable');
  //     }).finally(() => {
  //         this.saveDraftValues = [];
  //     });
  // }

  // ShowToast(title, message, variant, mode){
  //     const evt = new ShowToastEvent({
  //             title: title,
  //             message:message,
  //             variant: variant,
  //             mode: mode
  //         });
  //         this.dispatchEvent(evt);
  // }

  // // This function is used to refresh the table once data updated
  // async refresh() {
  //     await refreshApex(this.gridData);
  // }
      connectedCallback(){
        setTimeout(() => {
      //     this.myId = this.opportunity.data.fields.ContactId.value ;
      //     alert(this.opportunity.data.fields.ContactId.value);
      //  console.log('testing2'+JSON.stringify(this.opportunity.data.fields.ContactId.value ) ) 
     
      }, 5);
     
    }
    // @wire(getRecord, { recordId: '$recordId', fields: [CONTACT_ID_FIELD] })
    // opportunity;
    
    // @wire(getRecord, { recordId: '{contactId}', fields: [CONTACT_OBJECT.fields.Name] })
    // contact;
    
    // get contactId() {
    // return this.opportunity.data.fields.ContactId.value;
    // }
    
    // @wire(getRecord,{recordId:'$recordId'},fields:[ACCOUNT_ID])
    // opportunity;
    // get firstname() {
    //     return this.contact.data.fields.AccountId.value;
       
    // }
    // connectedCallback(){
    //     this.accId =this.contact.data.fields.AccountId.value;
    //     console.log('accId nOt wokring ');
    // }
    // get salutations() {
    //     let salutationOptions = [];
    //     Object.entries(this.salutationValues.data.values).forEach(val => {
    //         let values = val[1];
    //         salutationOptions.push({ 'label': values.label, 'value': values.value });
    //     }); 
    //     return salutationOptions;
    // }
}