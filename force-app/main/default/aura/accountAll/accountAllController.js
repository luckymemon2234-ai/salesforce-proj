({
doInit : function(component, event, helper) {
var action = component.get('c.GetAccount');

var self = this;
action.setCallback(this, function(actionResult) {
component.set('v.lstAccount', actionResult.getReturnValue());
});
$A.enqueueAction(action);
},
     searchKeyChange: function(component, event) {
        var searchKey = component.find("searchKey").get("v.value");
        
        var action = component.get("c.findByName");
        action.setParams({
            "searchKey": searchKey
        });
        action.setCallback(this, function(a) {
            component.set("v.lstAccount", a.getReturnValue());
        });
        $A.enqueueAction(action);
    }   
    
})