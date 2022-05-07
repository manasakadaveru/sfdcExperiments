({
    
    handleComponent : function(component, event, helper) {
        var caseId = component.get("v.recordId");
        var description = component.get("v.description");
        var saveRecAction = component.get("c.getCaseDetails"); 
        alert("caseId :" +caseId);
        saveRecAction.setParams({caseId : caseId, description : description});
        saveRecAction.setCallback(this, function(response) {
            var state = response.getState();
            alert('State:'+state);         
            if(state === "SUCCESS"){         
                var result = response.getReturnValue();
                alert('Response :'+result);
                component.set("v.recordEditForm",response.getReturnValue());
                $A.get('e.force:refreshView').fire();
                
            }else if(state === "ERROR"){                
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {                        
                        helper.ShowToastMsg(errors[0].message,'error','Error Message');
                    }
                }                
            }//component.set("v.Spinner", false); 
        });
        $A.enqueueAction(saveRecAction);
    }
})