@isTest
public class Covid19Test {
	@isTest
    public static void treatPatient_test(){
        //create instance of this class
        Covid19 jaipur = new Covid19(10);
        
        //check if the count is 10 or not
        integer treatedCount = jaipur.getTreated();
        //system.assertEquals(10, treatedCount, 'error message notification');
        Assert.areEqual(10, treatedCount, 'error message notification');
        
        //another instance
        Covid19 hyd = new Covid19(112);
        
        //check if the count is 112
        treatedCount = hyd.getTreated();
        system.assertEquals(112, treatedCount, 'count is not 112!');
        
        //check count of recovered In Country
        system.assertEquals(122, Covid19.recoveredInCountry, 'recovered In Country is not giving the expected output!');
        
        //check treatPatient function
        jaipur.treatPatient();
        treatedCount = jaipur.getTreated();
        //----------> recovered in area should be 11
        //----------> recovered in Country should be 123
        system.assert(treatedCount == 11, 'treatPatient function not giving expected out put');
        system.assert(Covid19.recoveredInCountry == 123, 'recoveredInCountry is not incremented!');
    }
    
    @isTest
    public static void treatPatient_test_Negative(){
        Covid19 jaipur = new Covid19(-10);
        integer recoveredInArea = jaipur.getTreated();
        system.assertEquals(0, recoveredInArea, 'value is coming out to be negative!');
    }
}