import { LightningElement,track } from 'lwc';
import  retriveNews from '@salesforce/apex/newsController.retriveNews';

export default class LwcNewsApi extends LightningElement {
    @track result = [];
    connectedCallback(){
        this.fetchNews();
        console.log('this is not working ');
    }
    async fetchNews(){
        console.log('this is not working 1');
    await    retriveNews().then(response=>{
            console.log('this is not working 2'+response.articles);
            this.formatNewData(response.articles)
        }).catch(error=>{
            console.log(error);
        })
    }
    formatNewData(res){
        console.log('this is not working 3');
    this.result = res.map((item,index)=>{
        let id = `news ${index+1}`;
        let name= item.source.name;
        return {...item,id:id,name:name}

    })
    }
}