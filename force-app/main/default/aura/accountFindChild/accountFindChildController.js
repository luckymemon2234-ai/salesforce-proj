({
	searchAccountChange : function(component, event, helper) {
		var sel = component.find('searchAccount').get('v.value');
        
        component.set('v.searchKey',sel);
                 var act = component.get('c.findAccountName');
         act.setParams({
            searchAccount: component.get("v.searchKey")
        });
         act.setCallback(this, function(res) {
           
            //res= a.getReturnValue();
           
       component.set("v.accList",res.getReturnValue());
     console.log(res.getReturnValue)
            
        });
         $A.enqueueAction(act);
        var cmpEvent = component.getEvent("accountFind");
        cmpEvent.setParams({
            
"accountName":component.get('v.accList')
                
        });
       cmpEvent.fire();
	}
})