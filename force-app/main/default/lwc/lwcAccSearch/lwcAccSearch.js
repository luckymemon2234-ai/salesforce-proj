import { LightningElement, wire, api, track } from "lwc";
import getAccount from "@salesforce/apex/lwcAcc.getAccount";
// import { NavigationMixin } from "lightning/navigation";
// import { refreshApex } from "@salesforce/apex";
// import { ShowToastEvent } from "lightning/platformShowToastEvent";
// import STATUS_FIELD from "@salesforce/schema/Account.Rating";

export default class LwcAccSearch extends LightningElement 
    {
        @track accName;
        ac;
        @track records;
        @track error;
        // handleChange(event){
        //    this.ac =  event.target.value;
        // }
        search(){
            this.ac = this.template.querySelector('lightning-input').value;
            
        }
        @wire (getAccount,{searchKey:'$ac'})
        wiredAccount({error,data}){
            if(data){
                this.records=data;
                this.error.error;
            }
            else {
                this.error=error;
                this.records=undefined;
            }
        } 
       
    }