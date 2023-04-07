public with sharing class MyCustomException extends Exception {
    

    // public MyCustomException()
    // {
    //     System.debug('Custom Exception Occurred');
    // }

    public override string getMessage()
    {
        return 'Custom Exception Occurred';
    }
}