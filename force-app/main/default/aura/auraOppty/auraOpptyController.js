({
    doInit : function(component, event, helper) {
         
        var recordId = component.get('v.recordId');
       var action = component.get('c.getopportunity');
        console.log('aura se record Id'+recordId);
           action.setParams({
            recordId:recordId
              
        });
         action.setCallback(this,function(response){
             
             console.log('response===> aura se '+JSON.stringify(response.getReturnValue()));
            component.set('v.accountList',response.getReturnValue());
        });
          $A.enqueueAction(action);
       
    },
	handleClick : function(component, event, helper) {
        component.set('v.mycolumns', [
            {label: 'ContactID', fieldName: 'ContactId'
             },
            {label: 'Contact.Name', fieldName: 'Name'}
            
            
        ]);
		var recordId = component.get('v.recordId');
       var action = component.get('c.opptyContactfetch');
        console.log('aura se record Id'+recordId);
           action.setParams({
            recId:recordId
              
        });
         action.setCallback(this,function(response){
             
             console.log('response===> aura se contat '+JSON.stringify(response.getReturnValue()));
            component.set('v.results',response.getReturnValue());
             component.set('v.contacts',response.getReturnValue());
        });
          $A.enqueueAction(action);

       
	}
      
    
})