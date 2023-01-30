public without sharing class SoilAnalysisTriggerHelper {
    public static Boolean sendConfirmationEmailToUser(SoilAnalysis__c sa) {
        Messaging.reserveSingleEmailCapacity(2);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'dopazo178@gmail.com'}; 
        String[] ccAddresses = new String[] {'jopazo@pucp.edu.pe'};
        mail.setToAddresses(toAddresses);
        mail.setCcAddresses(ccAddresses);
        mail.setReplyTo('test@test.com');
        mail.setSenderDisplayName('Agro Support');
        mail.setSubject('New Soil Analysis Created : ' + sa.Id);
        mail.setBccSender(false);
        mail.setUseSignature(false);
        mail.setPlainTextBody('The following Soil Analysis: ' + sa.Id +' has been created.');
        mail.setHtmlBody('The following Soil Analysis:<b> ' + case.Id +' </b>has been created.<p>'+
            'To view your case <a href=https://pisces-ocean-3469-dev-ed.scratch.lightning.force.com/'+sa.Id+'>click here.</a>'
        );
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        return true;
    }
}