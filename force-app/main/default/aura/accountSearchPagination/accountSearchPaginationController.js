({
	doInit : function(component, event, helper) {		
      helper.helperMethod(component); 
        var action = component.get("c.getType");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                var typeMap = [];
                for(var key in result){
                    typeMap.push({key: key, value: result[key]});
                }
                component.set("v.typeMap", typeMap);
            }
        });
        $A.enqueueAction(action);
        var action = component.get("c.getRating");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                var RatingMap = [];
                for(var key in result){
                    RatingMap.push({key: key, value: result[key]});
                }
                component.set("v.RatingMap", RatingMap);
            }
        });
        $A.enqueueAction(action);
	},
    handleCompanyOnChange : function(component,event,helper){
        console.log('Type' + component.find("Picklist").get("v.value"));
        component.set("v.accType", component.find("Picklist").get("v.value"));
        
        component.set("v.Rating", component.find("Rating").get("v.value"));
    },
    search: function(component,event,helper){
       
        helper.helperMethod2(component);
        
        

       
    },
      
    
    previous : function(component, event, helper){
        component.set("v.isLastPage",false);
        var sObjectList = component.get("v.accountList");       
        var startValue=component.get("v.startValue");
        var endValue=component.get("v.endValue");
        var perPage = component.get("v.perPageSize");       
        var totalRecords = component.get("v.totalRecords");
        var values=[];
        for(var i=startValue-perPage;i<startValue;i++){          
            values.push(sObjectList[i]);
        }
        component.set("v.PaginationList",values);
        component.set("v.startValue",startValue-perPage);
        component.set("v.endValue",startValue-1);
    },
  

    next : function(component, event, helper){
        var sObjectList = component.get("v.accountList");
        var startValue=component.get("v.startValue");
        var endValue=component.get("v.endValue");
        var perPage = component.get("v.perPageSize");
        var totalRecords = component.get("v.totalRecords");
        var values=[];
        if(totalRecords >= endValue+perPage+1){
            for(var i=endValue+1;i<endValue+perPage+1;i++){
            	values.push(sObjectList[i]);
        	}
            if(totalRecords == endValue+perPage+1){
                component.set("v.isLastPage",true);
            }
        }
        else{
            for(var i=endValue+1;i<totalRecords;i++){
          	values.push(sObjectList[i]);
        	}
            component.set("v.isLastPage",true);
        }
        component.set("v.PaginationList",values);
        component.set("v.startValue",endValue+1);
        component.set("v.endValue",endValue+perPage);
    },
    onSelectChange :function(component, event, helper){
    var pageSize = component.find("pageSize").get("v.value");
   
},
    
    getSelectedName:function(component, event, helper){
         var selRows = event.getParam('selectedRows');
         var valuesId=[];
       console.log('row selectd'+selRows);
        for (let i = 0; i < selRows.length; i++) {
            console.log('You selected: ' + selRows[i].Id);
            
            component.set("v.contactId",selRows[i].Id);
valuesId.push(selRows[i].Id);  
            console.log('values'+valuesId);
        }
       
       var searchKey = component.get("v.contactId");  
        console.log(searchKey);
             var act = component.get("c.getContacts");
         act.setParams({
            "i": valuesId
        });
        var data;
         act.setCallback(this, function(response) {
            component.set('v.lstContact', response.getReturnValue());
            console.log(response.getReturnValue())
                   var state = response.getState();

            component.set('v.contactList', response.getReturnValue());

            console.log(component.get('v.contactList'));


            var lengthVar = component.get("v.contactList").length;

            console.log('length///'+lengthVar);

            component.set("v.totalRecordsContact",lengthVar); 



            var perPageSizeContact = component.get("v.perPageSizeContact");



            var values=[];

            console.log('perPage///'+perPageSizeContact);

           

            if(lengthVar >= perPageSizeContact){

            	for(var i=0;i<perPageSizeContact;i++){

                    values.push(response.getReturnValue()[i]);

            	}

            }

            else{

                for(var i=0;i<lengthVar;i++){

                    values.push(response.getReturnValue()[i]);

                }

            }

            console.log('values///'+values);

            component.set("v.contactPaginationList",values);

            component.set("v.startValueContact",0);

            if(lengthVar <= (component.get("v.startValueContact")+perPageSizeContact)){

                component.set("v.isLastPageContact",true);

            }

            component.set("v.endValueContact",component.get("v.startValueContact")+perPageSizeContact-1);           

             
        });
     $A.enqueueAction(act);
         component.set('v.columnsContact', 

            [{label: 'LastName', fieldName: 'LastName', type: 'text'},
             {label: 'Email', fieldName: 'Email', type: 'text'},
             {label: 'AccountId', fieldName: 'AccountId', type: 'text'}

            ]);
    },
    
previousContact : function(component, event, helper){

        component.set("v.isLastPageContact",false);

        var sObjectList = component.get("v.contactList");

        console.log('sObjectList///',sObjectList);

        var startValueContact=component.get("v.startValueContact");

        var endValueContact=component.get("v.endValueContact");

        var perPageSizeContact = component.get("v.perPageSizeContact");

        console.log('startValue///',startValueContact);

        console.log('endValue///',endValueContact);

        var totalRecords = component.get("v.totalRecordsContact");

        var values=[];

        for(var i=startValueContact-perPageSizeContact;i<startValueContact;i++){

            console.log('i'+i);

            values.push(sObjectList[i]);

        }

        component.set("v.contactPaginationList",values);

        component.set("v.startValueContact",startValueContact-perPageSizeContact);

        component.set("v.endValueContact",startValueContact-1);    },
     nextContact : function(component, event, helper){

        var sObjectList = component.get("v.contactList");

        var startValueContact=component.get("v.startValueContact");

        var endValueContact=component.get("v.endValueContact");

        var perPageSizeContact = component.get("v.perPageSizeContact");
        var totalRecordsContact  = component.get("v.totalRecordsContact");

        var values=[];
        if(totalRecordsContact >= endValueContact+perPageSizeContact+1){

            for(var i=endValueContact+1;i<endValueContact+perPageSizeContact+1;i++){

            	values.push(sObjectList[i]);

        	}

            if(totalRecordsContact  == endValueContact+perPageSizeContact+1){

                component.set("v.isLastPage",true);

            }

        }

        else{

            for(var i=endValueContact+1;i<totalRecordsContact;i++){

            	values.push(sObjectList[i]);

        	}

            component.set("v.isLastPageContact",true);

        }

        component.set("v.contactPaginationList",values);

        component.set("v.startValueContact",endValueContact+1);

        component.set("v.endValueContact",endValueContact+perPageSizeContact);

    }
    
    
})