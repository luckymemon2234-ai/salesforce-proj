({
	parentController : function(component, event, helper) {
		var mess = event.getParam("accountName");
        component.set('v.eventName',mess);
        console.log(mess);
	}
})