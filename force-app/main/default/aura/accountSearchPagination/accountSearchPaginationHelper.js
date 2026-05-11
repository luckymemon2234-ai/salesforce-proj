({
	helperMethod : function(component) {
		  var action = component.get('c.searchAccounts');
        action.setCallback(this, function(response) {
         var state = response.getState();
            component.set('v.accountList', response.getReturnValue());
            var lengthVar = component.get("v.accountList").length;            
            component.set("v.totalRecords",lengthVar);             
           var perPage = 10;
          var values=[];
            if(lengthVar >= perPage){
            	for(var i=0;i<perPage;i++){
                    values.push(response.getReturnValue()[i]);
            	}
            }
            else{
                for(var i=0;i<lengthVar;i++){
                    values.push(response.getReturnValue()[i]);
                }
            }
component.get("v.getId");
console.log(component.get("v.getId"));            
            component.set("v.PaginationList",values);
            component.set("v.startValue",0);        
            if(lengthVar <= (component.get("v.startValue")+perPage)){
                component.set("v.isLastPage",true);
            }
            component.set("v.endValue",component.get("v.startValue")+perPage-1);           
        });
        $A.enqueueAction(action);
        component.set('v.columns', 
                      [{label: 'Name', fieldName: 'Name', type: 'text'},              
             {label: 'Type', fieldName: 'Type', type: 'text'},
              {label: 'Rating', fieldName: 'Rating', type: 'text'},
             {label: 'BillingCity', fieldName: 'BillingCity', type: 'text'},
             {label: 'BillingCountry', fieldName: 'BillingCountry', type: 'text'},
             {label: 'BillingState', fieldName: 'BillingState', type: 'text'},
                       
          
            ]);
	},
    helperMethod2 : function(component) {
                       
           var searchKey = component.find("searchAccount").get("v.value"); 
         var searchType = component.get("v.accType");
           var searchCity = component.find("searchAccountBillingCity").get("v.value");
           var searchRatings = component.get("v.Rating");
           var searchCountries = component.find("searchAccountBillingCountries").get("v.value");
           var searchStates = component.find("searchAccountBillingStates").get("v.value");             
             var act = component.get("c.searchAccountsFilter");
                       console.log(searchKey+searchType+searchCity+searchRatings+searchCountries+searchStates)
        
                       component.set("v.accName",searchKey);
                       component.set("v.accType",searchType);
                       component.set("v.Rating",searchRatings);
                       component.set("v.BillingCity",searchCity);
                       component.set("v.BillingCountry",searchCountries);
                       component.set("v.BillingState",searchStates);
                       
                       console.log(component.get("v.accName"));
                       console.log(component.get("v.accType"));
         act.setParams({
            "name": component.get("v.accName") ,
            "Type":component.get("v.accType"),
            "BillingCity":component.get("v.BillingCity"),
            "Rating":component.get("v.Rating"),
            "BillingCountry":component.get("v.BillingCountry"),
            "BillingState":component.get("v.BillingState")
                       
        });
        var data;
       
         act.setCallback(this, function(response) {
            component.set('v.acc', response.getReturnValue());           
             var state = response.getState();
            component.set('v.accountList', response.getReturnValue());
            var lengthVar = component.get("v.accountList").length;            
            component.set("v.totalRecords",lengthVar); 
           var perPage = component.get("v.perPageSize");
          var values=[];
            if(lengthVar >= perPage){
            	for(var i=0;i<perPage;i++){
                    values.push(response.getReturnValue()[i]);
            	}
            } else{
                for(var i=0;i<lengthVar;i++){
                    values.push(response.getReturnValue()[i]);
                }
            }            
            component.set("v.PaginationList",values);
            component.set("v.startValue",0);        
            if(lengthVar <= (component.get("v.startValue")+perPage)){
                component.set("v.isLastPage",true);
            }
            component.set("v.endValue",component.get("v.startValue")+perPage-1); 
        });
     $A.enqueueAction(act);
    component.set('v.columns', 
                      [{label: 'Name', fieldName: 'Name', type: 'text'},              
             {label: 'Type', fieldName: 'Type', type: 'text'},
              
              {label: 'Rating', fieldName: 'Rating', type: 'text'},
             
             {label: 'BillingCity', fieldName: 'BillingCity', type: 'text'},
             {label: 'BillingCountry', fieldName: 'BillingCountry', type: 'text'},
             {label: 'BillingState', fieldName: 'BillingState', type: 'text'}
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

    },
    
    
  

       
    
})