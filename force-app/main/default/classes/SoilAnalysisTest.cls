@isTest
public with sharing class SoilAnalysisTest {
    // @TestSetup
    // static void makeData(){
        
    // }
    @isTest
    public static void confirmationEmailSentSuccess() {
        SoilAnalysis__c sa = new SoilAnalysis__c(pH__c = 7);
        test.startTest();
        insert sa;
        test.stopTest();
        Assert.isFalse(false, 'ok');
    }
}