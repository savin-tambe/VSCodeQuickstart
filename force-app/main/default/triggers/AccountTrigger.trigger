trigger AccountTrigger on Account (before insert , before update , before delete , after insert, after update, after delete, after undelete) 
{

    /*
        Assignment 1 - Quetion 1
    */
    if(Trigger.isBefore && Trigger.isInsert)
    {
        AccountTriggerHelper.billingToShippingAddress(Trigger.new);
        
    }


    /*
        Assignment 1 - Quetion 2
    */
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        AccountTriggerHelper.updateIndustry(Trigger.old, Trigger.new);
    }


    /*
        Assignment 1 - Quetion 3
    */

    if(Trigger.isBefore && Trigger.isDelete)
    {
        AccountTriggerHelper.preventDeletion(Trigger.old);
    }


    /*
        Assignment 1 - Quetion 4
    */

    if(Trigger.isAfter && Trigger.isInsert)
    {
        AccountTriggerHelper.createTaskUnderActivity(Trigger.new);
    }




    /*
        Assignment 1 - Quetion 5
    */


}
