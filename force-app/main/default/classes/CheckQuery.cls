public with sharing class CheckQuery 
{
    public void accountFromContact (String name)
    {
    
    //SOQL Query to fetch account details using contact FirstName
    List<Contact> contact1 = [SELECT Account.Name, Account.Phone, Account.BillingCity FROM Contact WHERE FirstName = :name];

        System.debug('------SOQL Query to fetch account details using contact FirstName------');
    for(Contact contact : contact1) 
    {
        System.debug('Account Name: ' + contact.Account.Name);
        System.debug('Account Phone: ' + contact.Account.Phone);
        System.debug('Account Billing City: ' + contact.Account.BillingCity);
    }


    //SOSL Query to fetch account details using contact FirstName
    List<List<Contact>> searchResults = [FIND :name IN ALL FIELDS RETURNING Contact(Account.Name, Account.Phone, Account.BillingCity)];

    System.debug('------SOSL Query to fetch account details using contact FirstName------');
    if (!searchResults.isEmpty()) 
    {
        List<Contact> contact2 = (List<Contact>) searchResults[0];
        for(Contact contacts : contact2) 
        {
            System.debug('Account Name: ' + contacts.Account.Name);
            System.debug('Account Phone: ' + contacts.Account.Phone);
            System.debug('Account Billing City: ' + contacts.Account.BillingCity);
        }
    }

    }


    //SOQL Query to fetch Contact details using Account id
    public void contactFromAccount(String id)
    {
        
        List<Contact> contact3 = [select name , phone , email from contact where AccountId=:id order by Name desc];

        System.debug('------SOQL Query to fetch Contact details using Account id------');
        for(Contact contact : contact3) 
    {
        System.debug('Contact Name: ' + contact.Name);
        System.debug('Contact Phone: ' + contact.Phone);
        System.debug('Contact Email: ' + contact.Email);
    }
        
    }


    //Retrieving Account Information
    public void accountInformation (String id)
    {
         //SOQL Query to fetch Account details using Account id
    List<Account> accounttList = [Select Name , Phone , Industry from Account WHERE Id=:id];

    System.debug('------SOQL Query to fetch Account details using Account id------');
    for(Account listOfAccounts : accounttList)
    {
        System.debug('Account Name: ' + listOfAccounts.Name);
        System.debug('Account Phone: ' + listOfAccounts.Phone);
        System.debug('Account Industry: ' + listOfAccounts.Industry);
    }
    }


    //Retrieving job details using record type
    public void jobDetails(String recordType)
    {
        List<Job_Savin__c> jobInfo = [Select Name, Qualification_required__c, 	Salary_offered__c  from Job_Savin__c where RecordType.Name=:recordType];

        for(Job_Savin__c jobData : jobInfo)
        {
            System.debug('Job Name : '+jobData.Name);
            System.debug('Qualification Required : '+jobData.Qualification_required__c);
            System.debug('Salary Offered : '+jobData.Salary_offered__c);
            //System.debug('Record type : '+jobData.RecordType);
        }
    }



    public void soslQuery(String str)
    {
        List<List<SObject>> result = [find :str in all fields returning Account , Opportunity];

        System.debug(result);
    }

    

    //Inserting record in Account & contact object
    public void insertAccountContact()
    {
        Account accounts = new Account(Name='SFDX Training Inst' , AccountNumber='7894561' , 	Industry='Teaching' , Phone='7854218956' );
        insert accounts;

        Contact contacts = new Contact(AccountId=accounts.Id , FirstName='Ravindra', LastName='Tambade', Phone='9988774455');
        insert contacts;
    }



    //Updating Account & related contact information
    public void updateAccountContact()
    {
        Contact contacts = [Select LastName , Phone , Account.website from Contact where FirstName='Ravindra'];

        System.debug(contacts);

        contacts.Email='ravi@gmail.com';   
        contacts.Account.Website='www.transflower.com';

        update contacts;
        update contacts.Account;
    }






     //SOQL query to fetch candidate info from job
    //  public void candidatesFromJob (String jobName)
    //  {
    //     List<Job_Savin__c> jobs = [Select Candidate__c.Name__c , Candidate__c.Email__c , Candidate__c.State__c From Job_Savin__c where Name__c= :jobName];
    //     System.debug('------SOQL query to fetch candidate info from job-----');
    //     for(Job_Savin__c candidateList :jobs)
    //     {
    //         System.debug('Candidate Name : '+candidateList.Candidate__c.Name__c);
    //         System.debug('Candidate Email : '+candidateList.Candidate__c.Email__c);
    //         System.debug('Candidate State : '+candidateList.Candidate__c.State__c);
    //     }
    //  }



        //SOQL query to get Job details from candidate name

    // public void jobFromCandidate (String candidateName)
    //   {
    //     List<Candidate__c> candidate = [Select Job_Savin__c.Name__c , Job_Savin__c.Skills_required__c , Job_Savin__c.Salary_offered__c From Candidate__c where Name__c= :candidateName];
    //     System.debug('------SOQL query to fetch job info from candidate-----');
    //     for(Candidate__c jobDetails :candidate)
    //     {
    //         System.debug('Job Name : '+jobDetails.Job_Savin__c.Name__c);
    //         System.debug('Required Skills : '+jobDetails.Job_Savin__c.Skills_required__c);
    //         System.debug('Salary Offered : '+jobDetails.Job_Savin__c.Salary_offered__c);
    //     }
   
    //   }

    


}