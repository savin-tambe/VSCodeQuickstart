@isTest
public with sharing class TestArithmaticOperations 
{
    @isTest public static void TestPositiveCase() 
    {
        Integer add = ArithmaticOperations.addition(5,11);
        System.assertEquals(16, add,'Testing positive test case');

       
    }

    @isTest public static void TestPositiveCase1() 
    {
        Integer add = ArithmaticOperations.addition(-5,11);
        System.assertEquals(6, add,'Testing positive test case');

        
    }

    @isTest public static void TestNegativeCase() 
    {
        Integer add = ArithmaticOperations.addition(5,11);
        System.assertNotEquals(19, add);                             

    }

    @isTest public static void TestNegativeCase1() 
    {
        Integer add = ArithmaticOperations.addition(12,11);
        System.assertNotEquals(19, add);                             

    }
}