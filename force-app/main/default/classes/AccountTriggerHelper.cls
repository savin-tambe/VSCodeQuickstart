public with sharing class AccountTriggerHelper 
{

    //Quetion 1

    public static void billingToShippingAddress(List<Account> newAccounts)
    {
        for (Account accounts : newAccounts) 
        {
            accounts.ShippingStreet = accounts.BillingStreet;
            accounts.ShippingCity = accounts.BillingCity;
            accounts.ShippingState = accounts.BillingState;
            accounts.ShippingPostalCode = accounts.BillingPostalCode;
            accounts.ShippingCountry = accounts.BillingCountry;
            accounts.Industry = 'Engineering';
        }
    }


    //Quetion 2

    public static void updateIndustry(List<Account> oldAccount , List<Account> newAccount)
    {
       for(Account acc1 : oldAccount)
       {
            if(acc1.Industry=='Engineering')
            {
                for(Account acc2 : newAccount)
                {
                    if((acc2.Industry=='Finance'))
                    {
                        acc2.Active__c='Yes';
                    }
                }
            }
       }   
    }
    
    
   
    
    //Quetion 3

    public static void preventDeletion(List<Account> accountList)
    {

        for(Account account1 : accountList)
        {
            List<Opportunity> opportunityList = [Select id from Opportunity where AccountId =:account1.Id];

            if(account1.Active__c == 'Yes')
            {
                account1.Active__c.addError('You Can not delete this Account, Account is Active !');
            }
           else if(opportunityList.size()>0)
            {
                account1.Id.addError('You Can not delete this Account, Account has opportunity associated with it !');
            }
        }
    }



    //Quetion 4

    public static void createTaskUnderActivity(List<Account> accountList)
    {
        for(Account newAccount : accountList)
        {
            if(newAccount.AnnualRevenue>50000)
            {
                Task newTask = new Task();
                newTask.Subject=newAccount.Name;
                newTask.WhatId=newAccount.Id;
                newTask.Status='In  Progress';
                newTask.Priority='Normal';

                insert newTask;
            }
        }
        
    }



    //Quetion 5

    // public static void updateAccountPhone(List<Account> accountList)
    // {
    //     // for(Account newAccount : accountList)
    //     // {
            
    //     // }



    // }

    
}