@isTest
public class TaskUtilTest {
    @isTest
    public static void getTaskPriority_Test1(){
        
        String state = 'CA';
        
        Test.startTest();
        string result = TaskUtil.getTaskPriority(state);
        Test.stopTest();
        
        Assert.areEqual('High', result);
    }
    @isTest
    public static void getTaskPriority_Test2(){
        
        String state = '';
        
        Test.startTest();
        string result = TaskUtil.getTaskPriority(state);
        Test.stopTest();
        
        Assert.areEqual(null, result);
    }
    @isTest
    public static void getTaskPriority_Test3(){
        
        String state = 'CAR';
        
        Test.startTest();
        string result = TaskUtil.getTaskPriority(state);
        Test.stopTest();
        
        Assert.areEqual(null, result);
    }
    @isTest
    public static void getTaskPriority_Test4(){
        
        String state = 'NY';
        
        Test.startTest();
        string result = TaskUtil.getTaskPriority(state);
        Test.stopTest();
        
        Assert.areEqual('Normal', result);
    }
    
    @isTest
    public static void getTaskPriority_Test5(){
        
        String state = 'yu';
        
        Test.startTest();
        string result = TaskUtil.getTaskPriority(state);
        Test.stopTest();
        
        Assert.areEqual('Normal', result);
    }
    @isTest
    public static void getTaskPriority_Test6(){
        
        String state = 'Ca';
        
        Test.startTest();
        string result = TaskUtil.getTaskPriority(state);
        Test.stopTest();
        
        Assert.areEqual('High', result);
    }
    @isTest
    public static void getTaskPriority_Test7(){
        
        String state = 'cA';
        
        Test.startTest();
        string result = TaskUtil.getTaskPriority(state);
        Test.stopTest();
        
        Assert.areEqual('High', result);
    }
}