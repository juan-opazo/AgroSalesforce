public with sharing class SoilAnalysisController {
    @AuraEnabled(cacheable=true)
    public static SAEmailParams getSAEmailParams(){
        try {
            return new SAEmailParams(Org_Setting__mdt.getInstance('SA_Email_Params'));
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class SAEmailParams {
        @AuraEnabled public Boolean isActive { get; set; }
        @AuraEnabled public String replyTo { get; set; }
        @AuraEnabled public String senderDisplayName { get; set; }
        
        public SAEmailParams(Org_Setting__mdt saEmailParams) {
            this.isActive = saEmailParams.Is_Active__c;
            this.replyTo = saEmailParams.Reply_To__c;
            this.senderDisplayName = saEmailParams.Sender_Display_Name__c;
        }
    }
}