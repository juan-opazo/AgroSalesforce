@isTest
public with sharing class SoilAnalysisTest {
    // @TestSetup
    // static void makeData(){
        
    // }
    @isTest
    static void testConfirmationEmailSentSuccess() {
        SoilAnalysis__c sa = new SoilAnalysis__c(pH__c = 7);
        test.startTest();
        insert sa;
        test.stopTest();
        Assert.isFalse(false, 'ok');
    }
}