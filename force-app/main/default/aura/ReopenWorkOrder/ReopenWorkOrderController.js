({
	doInit : function(component, event, helper) {          
	helper.getAllRecords(component, event, helper);
	},
    SaveRecord : function(component, event, helper) {
       helper.updateHelper(component, event, helper);
    },
    handleExit : function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire() 
    },
    hideSpinner : function (component, event, helper) {
        component.set("v.Spinner", false);
    },
    showSpinner : function (component, event, helper) {
        component.set("v.Spinner", true);
    }
})