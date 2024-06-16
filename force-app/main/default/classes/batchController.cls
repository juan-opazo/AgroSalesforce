public with sharing class batchController {
    
    @AuraEnabled
    public static void executeBatch() {
        System.debug('success');
    }
}