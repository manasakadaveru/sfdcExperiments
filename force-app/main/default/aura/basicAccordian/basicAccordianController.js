({
	showActiveSection : function(component, event, helper) {
		alert(component.find("accordian").get('v.activeSectionName'))
	},
    showOpenSectionAlert : function(component, event, helper) {
		component.find("accordian").set('v.activeSectionName','B')		
	},
    showToggleSession : function(component, event, helper){
    	component.set('v.isDVisible', !component.get('v.isDVisible'))
	},
    handleSectionToggle: function (cmp, event) {
        var openSections = event.getParam('openSections');

        if (openSections.length === 0) {
            cmp.set('v.activeSectionsMessage', "All sections are closed");
        } else {
            cmp.set('v.activeSectionsMessage', "Open sections: " + openSections.join(', '));
        }
    }
})