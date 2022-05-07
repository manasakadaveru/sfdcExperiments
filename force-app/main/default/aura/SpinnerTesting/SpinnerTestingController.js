({
    doInit: function (component, event, helper) {
        component.set("v.showSpinner",true);
        var updateAcc = component.get("c.updateAccount");
        updateAcc.setParams({
            accId : component.get("v.recordId")
        });
        updateAcc.setCallback(this, function(Response){
            var responseState = Response.getState();
            if(responseState === 'SUCCESS'){
                $A.get('e.force:refreshView').fire();
                component.set("v.status", responseState);
                helper.showToast("Success",
                                "Success",
                                'Account has been updated.'
                                );
            }
            else{
                let errors = Response.getError();
                var messageVar = '';
                if (errors && Array.isArray(errors) && errors.length > 0) {
                    messageVar = errors[0].message;
                }
                helper.showToast("error",
                                    "Error",
                                    messageVar
                                    );
            }
            $A.get('e.force:closeQuickAction').fire();
        });
        $A.enqueueAction(updateAcc);
    }
})