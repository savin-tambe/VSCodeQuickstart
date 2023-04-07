public with sharing class ExceptionHandlingAssignment 
{

    //Method to check DML Exception Handling
    public void dmlExceptionHandling()
    {
        try 
        {
            Account newAccount = new Account();
            //newAccount.Name='SavinTambe';            //required field 
            newAccount.AccountNumber='2132546';
            insert newAccount;    
        } 
        catch (DmlException dmlExcep) 
        {
            System.debug('--------------------DML Exception------------------\n'+dmlExcep.getMessage()); 
        }
    }

    //Method to check List Exception Handling
    public void listExceptionHandling()
    {
        try 
        {
            //Contact newContact = new Contact();
            List<Contact> contactList = new List<Contact>();
            Contact newContact = contactList[0];  
        } 
        catch (ListException listExcep) 
        {
            System.debug('--------------------List Exception------------------\n'+listExcep.getMessage());
        }
    }

    //Method to check NullPointer Exception Handling
    public void nullPointerExceptionHandling()
    {
        try 
        {
           Account accInfo = null;
           insert accInfo;
        } 
        catch (NullPointerException nullPointerExcep) 
        {
            System.debug('--------------------Null Exception------------------\n'+nullPointerExcep.getMessage());      //Implementing NullPointer Exception
        }
    }

    //Method to check Query Exception Handling
    public void queryExceptionHandling()
    {
        try 
        {
            Employee__c employees = [Select id, name from Employee__c];
            insert employees;

        } 
        catch (QueryException queryExcep) 
        {
            System.debug('--------------------Query Exception------------------\n' + queryExcep.getMessage());
        }
    }


    //Method to check Custom Exception Handling
    public void myCustomException()
    {
        try
        {
            throw new MyCustomException('Invalid Exception');
        }
        catch( MyCustomException customException)
        {
            System.debug('--------------------Custom Exception------------------\n' + customException.getMessage());
        }
    }
}