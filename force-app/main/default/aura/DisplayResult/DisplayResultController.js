({
	getValueFromApplicationEvent : function(cmp, event) {
        var ShowResultValue = event.getParam("PassResult");
        alert(ShowResultValue);
        // set the handler attributes based on event data
        cmp.set("v.Get_Result", ShowResultValue);
    }
})