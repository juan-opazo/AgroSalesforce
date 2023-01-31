public with sharing class SoilAnalysisController implements Metadata.DeployCallback {
    @AuraEnabled(cacheable=true)
    public static SAEmailParams getSAEmailParams(){
        try {
            return new SAEmailParams(Org_Setting__mdt.getInstance('SA_Email_Params')?.Is_Active__c);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static Boolean updateSAEmailParams(Map<String,SObject> saEmailParamsMap){
        try {
            Org_Setting__mdt orgSetting = Org_Setting__mdt.getInstance('SA_Email_Params');

            // customMetadata.Is_Active__c = saEmailParams.isActive;

            Metadata.CustomMetadata customMetadata =  new Metadata.CustomMetadata();
            // customMetadata.fullName = orgSetting.fullName;
            customMetadata.label = orgSetting.label;
            
            Metadata.CustomMetadataValue isActiveField = new Metadata.CustomMetadataValue();
            isActiveField.field = 'Is_Active__c';
            isActiveField.value = saEmailParams.isActive; 
            customMetadata.values.add(isActiveField);
            
            
            Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
            mdContainer.addMetadata(customMetadata);
            SoilAnalysisController callback = new SoilAnalysisController();
            Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, callback);

            return true;
        } catch (Exception e) {
            if (saEmailParams==null) throw new AuraHandledException('chale');
            throw new AuraHandledException(e.getMessage());
        }
    }

    public void handleResult(Metadata.DeployResult result, Metadata.DeployCallbackContext context) {
        if (result.status == Metadata.DeployStatus.Succeeded) {
            System.debug(' success : '+ result);
        } else {
            System.debug(' fail : '+ result);
        }
    }

    public class SAEmailParams {
        @AuraEnabled 
        public Boolean isActive { get; set; }

        public SAEmailParams(Boolean isActive) {
            this.isActive = isActive;
        }
    }
}