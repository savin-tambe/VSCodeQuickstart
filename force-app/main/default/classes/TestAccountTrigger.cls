@isTest
public with sharing class TestAccountTrigger {


    //---------------------------------Quetion 1 Tests Method--------------------------------------------

    @isTest  
    static void testbillingToShippingAddressPositive()           //Positive Test Case
    {
        // Create an account with billing address information
        List <Account> testAccountList = new List<Account>();

       for(Integer i=0; i<25 ;i++)
       {
        Account testAccount = new Account();
        testAccount.Name = 'Test Account'+i;
        testAccount.BillingStreet = 'Baner'+i;
        testAccount.BillingCity = 'Pune'+i;
        testAccount.BillingState = 'MH'+i;
        testAccount.BillingPostalCode = '41101'+i;
        testAccount.BillingCountry = 'IND'+i;

         testAccountList.add(testAccount);
       }

        Database.insert(testAccountList,false);

        // Retrieve the updated account and check that shipping address and industry were updated
      
         List<Account> newAccountList = [SELECT Id, ShippingStreet, BillingStreet,  ShippingCity, BillingCity , ShippingState, BillingState,  ShippingPostalCode, BillingPostalCode,  ShippingCountry , BillingCountry, Industry FROM Account WHERE Name like 'Test Account'];
        
         for(Account updatedAccount : newAccountList )
         {
        System.assertEquals(updatedAccount.ShippingStreet, updatedAccount.BillingStreet);
        System.assertEquals(updatedAccount.ShippingCity, updatedAccount.BillingCity);
        System.assertEquals(updatedAccount.ShippingState, updatedAccount.BillingState);
        System.assertEquals(updatedAccount.ShippingPostalCode, updatedAccount.BillingPostalCode);
        System.assertEquals(updatedAccount.ShippingCountry, updatedAccount.BillingCountry);
        System.assertEquals(updatedAccount.Industry, 'Engineering');
         }
    }


    @isTest
    static void testbillingToShippingAddressNegative()             //Negative Test Case
    {  
        Account testAccount = new Account();
        testAccount.Name = 'Test Account';
        testAccount.BillingStreet = 'Baner';
        testAccount.BillingCity = 'Pune';
        testAccount.BillingState = 'MH';
        testAccount.BillingPostalCode = '41101';
        testAccount.BillingCountry = 'IND';
        insert testAccount;

        // Retrieve the updated account and check that shipping address and industry were not updated

        Account updatedAccount = [SELECT Id, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, Industry FROM Account WHERE Id = :testAccount.Id];
        System.assertNotEquals(updatedAccount.ShippingStreet, null);
        System.assertNotEquals(updatedAccount.ShippingCity, null);
        System.assertNotEquals(updatedAccount.ShippingState, null);
        System.assertNotEquals(updatedAccount.ShippingPostalCode, null);
        System.assertNotEquals(updatedAccount.ShippingCountry, null);
        System.assertNotEquals(updatedAccount.Industry, null);
    }
    
    
   
    //-----------------------------------Quetion 2 Test Method--------------------------------------
    @isTest
    static void testUpdatedIndustryPositive()           //Positive Test Case
    {
        List <Account> accountList = new List<Account>();

        for(Integer acc  = 0; acc < 25 ; acc++)
        {
            Account account = new Account();
            account.Name='New Test Account '+acc;
            account.Industry='Engineering';  

            accountList.add(account);
        }

        Database.insert(accountList,false);


        List<Account> newAccountList = [Select Id,Name  From Account];
        List<Account> newObjectForUpdate=new List<Account>();
        for(Account acc : newAccountList)
        {   
            acc.Industry='Finance';
            newObjectForUpdate.add(acc);
        }

        Database.update(newObjectForUpdate,false);
        
        List<Account> updatedList = [Select Name , Active__c ,Industry  From Account where Name like 'New Test Account'];

        for(Account acc : updatedList)
        {
            System.assertEquals('Yes', acc.Active__c,'');
        }
    }



     //----------------------------------Quetion 3 Test Method-----------------------------
    @isTest
    static void testPreventDeletion()
    {
        List<Account> accountList = new List<Account>();
           
        for(Integer itr=0; itr<20; itr++){
            Account accountObject=new Account();
            accountObject.Name='Account Test_'+itr;
            accountObject.Active__c='Yes';
            accountList.add(accountObject);
        }
        Database.insert(accountList,false);
        List<Account> updatedAccountList = [Select Id,Name from Account];
        Account accountObject1=[select Id from Account where Name='Account Test_0'];
        Date mydate=date.newInstance(2023, 5, 5);
        Opportunity oppObject=new Opportunity(Name='For Test_1',StageName='Closed Won',CloseDate=mydate,Amount=80000,AccountId=accountObject1.Id);
        insert oppObject;
        Database.delete(updatedAccountList,false);
        List<Account> delObject=[Select Id,Name from Account];
        System.assertNotEquals(0, delObject.size());
    
    }



    //--------------------------Quetion 4 Test Method------------------------------

    @isTest
    static void testcreatedTaskUnderActivity()
    {
        List<Account> accountList = new List<Account>();

        for(Integer itr=0; itr<20; itr++){
            Account accountObject=new Account();
            accountObject.Name='Test Account Quetion_'+itr;
            accountObject.AnnualRevenue=50891;
            accountList.add(accountObject);
        }

        Database.insert(accountList,false);
        List<Account> updatedAccount = [Select Id from Account];
        List<Task> newTask =[select Id from Task];   
        System.assertEquals(updatedAccount.size(), newTask.size());
        
        
    }
    
    
}