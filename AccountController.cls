public with sharing class AccountController {
    public static List<Account> getAllActiveAccounts() {
      return [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
      return [SELECT Name, AnnualRevenue, Industry FROM Account ORDER BY Name];
      //throw new AuraHandledException('Forced error');
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getRelatedContacts(Id accountId) {
      return [SELECT Name, Title, Email, Phone FROM Contact WHERE AccountId = :accountId];
    }
  }