import { LightningElement, api} from 'lwc';
import opptyfetch from '@salesforce/apex/LightningOpp.opptyfetch';

 

const columns1 = [
    {label: "Opportunity Name", fieldName: 'Name'},
]
const columns2 = [
    {label: "Contact Name", fieldName: 'Name'},
]
export default class lwcOAcc extends LightningElement {

    @api buttonLabel = "Show";
    opportunityData = [];
    contactData = [];

 

    columns1 = columns1;
    columns2 = columns2;

 

    @api recordId;
    @api showDatatable = false;

 

    opportunityTempArray =[];
    contactTempArray =[];

 

    handleShow(event){

 

        if(event.target.label == "Show"){
            this.buttonLabel = "Hide";
            this.showDatatable = true;
        }

 

        else if(event.target.label == "Hide"){
            this.buttonLabel = "Show";
            this.showDatatable = false;
        }
    }
    connectedCallback(){
        opptyfetch({ recId : this.recordId})
        .then( res => {
            let tempRecords = res;
            console.log("tempRecords:"+JSON.stringify(tempRecords));

 

            let temp = tempRecords.map(row => {
                return Object.assign({
                    OppName : row.Opportunities , ContactName : row.Contacts
                })
              console.log("temp>>:"+JSON.stringify(temp));
            })
            temp.forEach(element => {
                this.opportunityTempArray = element.OppName;
                console.log("this.opportunityTempArray:"+JSON.stringify(this.opportunityTempArray));
                this.contactTempArray = element.ContactName;
                console.log("this.contactTempArray:"+JSON.stringify(this.contactTempArray));
            });
            this.opportunityData = this.opportunityTempArray;
            this.contactData = this.contactTempArray;
        })
        .catch(error =>{
            console.error("error:"+JSON.stringify(error));
        })
    }}