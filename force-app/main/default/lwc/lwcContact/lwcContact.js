import { LightningElement,api,wire,track } from 'lwc';
import displayAccounts from '@salesforce/apex/lwcContact.displayAccounts';
import updateRecord from '@salesforce/apex/lwcContact.updateRecord';
import { refreshApex } from '@salesforce/apex';
const  gridColumns = [ 
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

  ];
export default class LwcContact extends LightningElement {
   
	@api errorMessage;
    @api recordId;
    @track gridData;
    @wire (displayAccounts ,{ recId: '$recordId'})
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
   // @wire(displayAccounts) contacts;
    handleUpdate(event){
        this.recId=event.target.value;
        console.log('@@currentRecordId1111@@@'+this.recId);
        updateRecord({
            conId:this.recId
        })
        .then(() => {
            console.log('SUCCESS');
            return refreshApex(this.gridData);
        })
        .catch((error) => {
            this.errorMessage=error;
			console.log('unable to update the record due to'+JSON.stringify(this.errorMessage));
        });
        window.reload()
    }


}