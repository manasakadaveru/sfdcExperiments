import { ShowToastEvent} from 'lightning/platformShowToastEvent';

import { getFieldValue, getFieldDisplayValue } from 'lightning/uiRecordApi';

const _getDisplayValue = function(data,field){
    return getFieldDisplayValue(data,field) ? getFieldDisplayValue(data,field) : getFieldValue(data,field);
}

const showToast = function(thisArg, toastTitle, toastMessage, toastVariant){

    const eventRef = new ShowToastEvent({
        title : toastTitle,
        message : toastMessage,
        variant : toastVariant
    });

    thisArg.dispatchEvent(eventRef);
}

export{
    showToast, _getDisplayValue
}