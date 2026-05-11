import { LightningElement,track,api } from 'lwc';
import fake from '@salesforce/apex/lwcFakeStore.fake';
export default class LwcFakeStore extends LightningElement {
@track result;
connectedCallback(){
    this.classStore();
}
classStore(){
    fake().then(res=>{
        console.log(res);
        this.result = JSON.parse(res);

    })
}

}