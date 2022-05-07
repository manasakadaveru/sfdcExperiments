({
    openTabWithSubtab : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.openTab({
            url: '/lightning/r/Account/0012v000030HECJAA4/view',
            focus: true
        }).then(function(response) {
            workspaceAPI.openSubtab({
                parentTabId: response,
                url: '/lightning/r/Contact/0032v00003UNbqYAAT/view',
                focus: true
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    }
})