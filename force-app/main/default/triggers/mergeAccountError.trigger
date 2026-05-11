trigger mergeAccountError on Account (before insert ,before update) {
      String profileName = [SELECT Name FROM Profile WHERE Id = :UserInfo.getProfileId()].Name;

for(Account record: Trigger.new) {
  if( profileName == 'System Administrator' ) {
    record.addError('you Cannot edit as you dont hava access');
}

}

}