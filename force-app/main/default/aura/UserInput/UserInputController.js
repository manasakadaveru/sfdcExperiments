({
	add : function(component, event, helper) {
		var getFirstValue = component.find("Input1").get("v.value");
        var getSecondValue = component.find("Input2").get("v.value");
        var result = getFirstValue+" "+getSecondValue;
        alert("values="+getFirstValue);
        alert("values="+result);
        var evt = $A.get("e.c:ResultEventInpToOutP");
        evt.setParams({"PassResult":result});
        evt.fire();
	}
})