({
    getAllRecords  : function(component, event, helper) {
        var  idVal = component.get("v.recordId");
        var getWorkorder = component.get("c.getWorkOrder");
        getWorkorder.setParams({"woId": idVal});
        getWorkorder.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.workOrderNumber", response.getReturnValue().Name);
                component.set("v.workOrderStatus", "Open");
                
            }
        });
        $A.enqueueAction(getWorkorder);        
    },
    
    updateHelper : function(component, event, helper){
        var IdVal = component.get("v.recordId");
        var action = component.get("c.saveRecord");
        
        action.setParams({
            'value' : component.get("v.recordId")
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                helper.ShowToastMsg('Work order Opened','success','Success Message');
                var workspaceAPI = component.find("workspace");
                workspaceAPI.getFocusedTabInfo().then(function(response) {
                    var focusedTabId = response.tabId;
                    workspaceAPI.refreshTab({
                        tabId: focusedTabId,
                        includeAllSubtabs: true
                    });
                })
                .catch(function(error) {
                    console.log(error);
                });    
            }
            else if(state === "ERROR"){
                if (errors[0] && errors[0].message) {
                    //alert(errors[0].message);
                    component.set("v.errorMessage", errors[0].message);
                    document.getElementById('dispMessage').style.display = '';
                }
            }
                else{
                    helper.ShowToastMsg('Work Order cant be closed','error','Error Message');
                }
        });
        $A.enqueueAction(action);
    },
    
    
    ShowToastMsg:function(msg,type,title) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : title,
            message: msg,
            duration:' 5000',
            key: 'info_alt',
            type: type,
            mode: 'pester'
        });
        toastEvent.fire();        
    }
})