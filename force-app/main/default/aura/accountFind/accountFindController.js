({
	doInit : function(component, event, helper) {
		var act = component.get("c.findAcc");
        
        act.setCallback(this, function(Res) {
        component.set('v.lstAccount', Res.getReturnValue());
});
        $A.enqueueAction(act);
	},
    
    searchAccountChange :    
    function(component, event, helper) {
       var searchAccount = component.find("searchAccount").get("v.value");        
        var act = component.get("c.findAccountName");
        act.setParams({
            "searchAccount": searchAccount
        });
        act.setCallback(this, function(a) {
            component.set("v.lstAccount", a.getReturnValue());
            console.log(a.getReturnValue())
        });
     $A.enqueueAction(act);
    }
                        
})