({
    handleClick : function(component, event, helper) {
        const payload =
        {
            recordId: component.get('v.recordId'),
            recordData : {
                Name: component.get('v.simpleRecord.Name'),
                Industry: component.get('v.simpleRecord.Industry')
            }
        }
        console.log(payload);
        component.find('sampleMessageChannel').publish(payload);
    }
})