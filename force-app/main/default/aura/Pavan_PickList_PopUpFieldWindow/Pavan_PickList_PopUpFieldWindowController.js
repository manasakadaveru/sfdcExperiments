({
	doInit : function(component, event, helper) {
        alert("Entered to INIT");
        /*var selected = evt.getSource().get("v.label");
        var descValue = component.find("v.description").get("v.value");
        var statusValue = component.find("v.status").get("v.value");
        
        component.set("v.description", descValue);
        component.set("v.status", statusValue);
        
        alert("Status "+statusValue);
        alert("Description "+description);
        if(statusValue === 'Closed'){
            component.set("v.recordEditForm", true);
        }
        else{
            component.set("v.recordEditForm", false);
        }*/        
		helper.handleComponent(component, event, helper);
        
	},
    
    isClosed: function(component, event, helper)
    {
        alert("Entered to isClosed");
        let fieldName = event.getSource().get("v.fieldName") ; 
        let newValue =  event.getSource().get("v.value") ; 
        let status = component.get("v.status") ; 
        if(status[fieldName].value ==null && newValue == ""  )  { //we know the value is blank from the UI 
            status[fieldName].value = newValue ; 
            component.set("v.status", status); 
        }
    },
   
    handleSaveButton: function(component, event, helper) {
        var newButton = component.find("newButtonDiv");
        $A.util.toggleClass(newButton, "slds-hide");
        /*
        component.find("CaseRecord").saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                alert("Save completed successfully.");
            } else if (saveResult.state === "INCOMPLETE") {
                alert("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
               var errMsg = "";
                // saveResult.error is an array of errors,
                // so collect all errors into one message
                for (var i = 0; i < saveResult.error.length; i++) {
                    errMsg += saveResult.error[i].message + "\n";
                }
                //cmp.set("v.recordSaveError", errMsg);
            } else {
            alert('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
        }));*/
    }
})