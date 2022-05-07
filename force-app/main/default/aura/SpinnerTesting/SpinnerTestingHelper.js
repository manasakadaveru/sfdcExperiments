({
    showToast : function(variant, title, message) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "type": variant,
            "title": title,
            "message": message,
            "duration": "5000",
        });
        toastEvent.fire();
    },
})