public without sharing class SoilAnalysisTriggerHandler {
    private boolean triggerIsExecuting;
    private integer triggerSize;
    public SoilAnalysisTriggerHandler(boolean triggerIsExecuting, integer triggerSize) {
        this.triggerIsExecuting = triggerIsExecuting;
        this.triggerSize = triggerSize;
    }
    public void beforeInsert(List<SoilAnalysis__c> newSoilAnalysis) {
        System.debug('test');
    }
    public void beforeUpdate(List<SoilAnalysis__c> oldSoilAnalysis, List<SoilAnalysis__c> newSoilAnalysis, Map<ID, SoilAnalysis__c> oldSoilAnalysisMap, Map<ID, SoilAnalysis__c> newSoilAnalysisMap) {
        System.debug('test');
    }
    public void beforeDelete(List<SoilAnalysis__c> oldSoilAnalysis, Map<ID, SoilAnalysis__c> oldSoilAnalysisMap) {
        System.debug('test');
    }
    public void afterInsert(List<SoilAnalysis__c> newSoilAnalysis, Map<ID, SoilAnalysis__c> newSoilAnalysisMap) {
        for (Id key : newSoilAnalysisMap.keySet()) {
            SoilAnalysisTriggerHelper.sendConfirmationEmailToUser(newSoilAnalysisMap.get(key));
        }
    }
    public void afterUpdate(List<SoilAnalysis__c> oldSoilAnalysis, List<SoilAnalysis__c> newSoilAnalysis, Map<ID, SoilAnalysis__c> oldSoilAnalysisMap, Map<ID, SoilAnalysis__c> newSoilAnalysisMap) {
        System.debug('test');
    }
    public void afterDelete(List<SoilAnalysis__c> oldSoilAnalysis, Map<ID, SoilAnalysis__c> oldSoilAnalysisMap) {
        System.debug('test');
    }
    public void afterUndelete(List<SoilAnalysis__c> newSoilAnalysis, Map<ID, SoilAnalysis__c> newSoilAnalysisMap) {
        System.debug('test');
    }
}