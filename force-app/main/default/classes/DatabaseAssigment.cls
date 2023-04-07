public with sharing class DatabaseAssigment 
{
    // public DatabaseAssigment() 
    // {

    // }

    public static void saveBook()
    {
        Author__c author = new Author__c(Name='RS Agarwal', Category__c='General');
		Database.insert(author);
        Book__c book1 = new Book__c(Name='Reasoning', Author__c=author.id ,Publisher__c='S Chand');
        Book__c book2 = new Book__c(Name='Quantitative',Publisher__c='S Chnad');

        List<Database.SaveResult> results = Database.insert(new List<Book__c>{book1 , book2}, false);
    
        Boolean bookInserted1 = results[0].isSuccess();
        Boolean bookInserted2 = results[1].isSuccess();

        System.debug('Book 1 Inserted ? '+bookInserted1);
        System.debug('Book 2 Inserted ? '+bookInserted2);
    }
    
    public static void updateAuthor()
    {
        List<Author__c> authorDetails = new List<Author__c>();

        Author__c author = [Select Name, Category__c from Author__c];

        author.Category__c='Competitive Exams';
        authorDetails.add(author);

        Database.SaveResult[] result= Database.update(authorDetails,False);
        
        System.debug(result);
    }
    
    
    //Assignment 3
    public static void deleteBook()
    {
        List<Book__c> bookList = new List<Book__c>();

        bookList =  [Select Name , Publisher__c from Book__c];

        System.debug(bookList);

    }
 
}