public without sharing class SoilAnalysisTriggerHelper {
    public static Boolean sendConfirmationEmailToUser(SoilAnalysis__c sa) {
        if (Org_Setting__mdt.getInstance('SA_Email_Params')?.Is_Active__c == true) {
            Messaging.reserveSingleEmailCapacity(2);
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] { Org_Setting__mdt.getInstance('SA_Email_Params')?.To_Address__c }; 
            mail.setToAddresses(toAddresses);
            mail.setReplyTo(Org_Setting__mdt.getInstance('SA_Email_Params')?.Reply_To__c);
            mail.setSenderDisplayName(Org_Setting__mdt.getInstance('SA_Email_Params')?.Sender_Display_Name__c);
            mail.setSubject(Org_Setting__mdt.getInstance('SA_Email_Params')?.Subject__c);
            mail.setBccSender(Org_Setting__mdt.getInstance('SA_Email_Params')?.Bcc_Sender__c);
            mail.setUseSignature(Org_Setting__mdt.getInstance('SA_Email_Params')?.Use_Signature__c);
            mail.setPlainTextBody(Org_Setting__mdt.getInstance('SA_Email_Params')?.Plain_Text_Body__c);
            mail.setHtmlBody(Org_Setting__mdt.getInstance('SA_Email_Params')?.Html_Body__c);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            return true;
        } else {
            return false;
        }
        
    }
}
// 'The following Soil Analysis:<b> ' + case.Id +' </b>has been created.<p>'+
//                 'To view your case <a href=https://pisces-ocean-3469-dev-ed.scratch.lightning.force.com/'+sa.Id+'>click here.</a>'