trigger UpdateAddressApprovalOrRejectCountOnAccount on Contact (after update) {
    UpdateAddApproveOrRejectCountOnAccHelper.updateApprovalOrrejectCount(trigger.new, trigger.oldMap, trigger.newMap);
}