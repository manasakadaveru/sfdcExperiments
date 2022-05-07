trigger StudentUpdateWithLibrary on Library__c (before Update) {
	StudentRecordUpdation.islibraryOpened(Trigger.old);
    //StudentRecordUpdation.islibraryOpened(Trigger.old);
}