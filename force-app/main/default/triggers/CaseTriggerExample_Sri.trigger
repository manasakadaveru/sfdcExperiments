trigger CaseTriggerExample_Sri on Case (before insert) {
	System.debug('BEFORE EVENT FIRED');
}