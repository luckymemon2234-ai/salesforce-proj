import { LightningElement,api,wire,track } from 'lwc';
import accAcount from '@salesforce/apex/LightningOpp.accAcount';
import conAcount from '@salesforce/apex/LightningOpp.conAcount';
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import accfetch from '@salesforce/apex/LightningOpp.accfetch';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';


export default class LwcOpptyA extends LightningElement {
  @track aId;
  @api recordId;
  @track contacts;
  opportunityTempArray =[];
  @track accounts;
  @track OppName;
 // accId = recordId;
//  @wire(accAcount,{recId:'$recordId'})
//   accounts;
connectedCallback(){
  this.aId = this.recordId;
  console.log('working1')
  accAcount({ recId: this.aId })
      .then((result) => {
          this.accounts = result;
          this.error = undefined;
      })
      .catch((error) => {
          this.error = error;
          this.accounts = undefined;
      });

      conAcount({ recId: this.aId })
      .then((result) => {
          this.contacts = result;
          this.error = undefined;
      })
      .catch((error) => {
          this.error = error;
          this.contacts = undefined;
      });
}


handleSearch() {
  // console.log('button clicked 4')
  // this.OppName = acounts.id;
  // let temp = accounts.map(row => {
    
 //     this.OppName = row.Id 
       
       
   
    

    // console.log("temp>>:"+JSON.stringify(temp));
    // temp.forEach(element => {
    //             this.opportunityTempArray = element.OppName;
    //             console.log("this.opportunityTempArray:"+JSON.stringify(this.opportunityTempArray)); });
    //             this.OppName  = this.opportunityTempArray;  })
}


//   @wire (accAcount,{recId:'0065g00000Q1L9ZAAV'}) wiredAccounts({error,data}){
//     console.log('workings44');
   
//     accAcount({recId : '0065g00000Q1L9ZAAV'})

// .then(result => {
// this.accounts = result;

// console.log(JSON.stringify(result));
// console.log("result1",this.con);
// })
// .catch(error =>{
// this.error = error;

// })
// }
}