trigger ContactTrg on Contact (before update) {
    ContactTRGUtils.setApprover(trigger.new, trigger.isUpdate, trigger.isInsert, trigger.isDelete, trigger.isAfter);
}