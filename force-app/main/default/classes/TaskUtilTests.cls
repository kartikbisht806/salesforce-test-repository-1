@isTest
public class TaskUtilTests {
	@isTest
    static void testGetTaskPriorityHigh(){
        String state = 'CA';
        
        Test.startTest();
        string result = TaskUtil.getTaskPriority(state);
        Test.stopTest();
        
        Assert.areEqual('High', result);
    }
    @isTest
    public static void testGetTaskPriorityNormal(){
        
        String state = 'NY';
        
        Test.startTest();
        string result = TaskUtil.getTaskPriority(state);
        Test.stopTest();
        
        Assert.areEqual('Normal', result);
    }
}