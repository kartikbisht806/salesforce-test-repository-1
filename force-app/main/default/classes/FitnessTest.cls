@isTest
public class FitnessTest {
	@isTest
    public static void calculateBMI_TestCase1(){
        Decimal weight = 60;
        Decimal height = 1.2;
        Decimal result = Fitness.calculateBMI(weight, height);
        system.assertEquals(41.67, result, 'BMI should be equal to 41.67!');
    }
    
    @isTest
    public static void calculateBMI_TestCase2(){
        Decimal weight = 0;
        Decimal height = 1.2;
        Decimal result = Fitness.calculateBMI(weight, height);
        system.assertEquals(0, result, 'BMI should be equal to 0');
    }
    
    @isTest
    public static void calculateBMI_TestCase3(){
        Decimal weight = 60;
        Decimal height = 0;
        Decimal result = Fitness.calculateBMI(weight, height);
        system.assertEquals(-1, result, 'Height cannot be 0');
    }
    
    @isTest
    public static void calculateBMI_TestCase4(){
        Decimal weight = -60;
        Decimal height = 1.2;
        Decimal result = Fitness.calculateBMI(weight, height);
        system.assertEquals(-1, result, 'Weight cannot be negative');
    }
    
    @isTest
    public static void calculateBMI_TestCase5(){
        Decimal weight = 60;
        Decimal height = -1.2;
        Decimal result = Fitness.calculateBMI(weight, height);
        system.assertEquals(-1, result, 'Height cannot be negative');
    }
    
    //----------------------------------------------------------------------------------------->
    
    @isTest
    public static void calculatePace_TestCase1(){
        Decimal distance = 10;
        Decimal minutes = 60;

        Decimal result = Fitness.calculatePace(distance, minutes);
        System.assertEquals(10, result, 'Pace should be 10km/hr for 10 km in 60 minutes');

    }
    @isTest
    public static void calculatePace_TestCase2(){
        Decimal distance = 10;
        Decimal minutes = 0;

        Decimal result = Fitness.calculatePace(distance, minutes);
        System.assertEquals(-1, result, 'Invalid input');
    }

    @isTest
    public static void calculatePace_TestCase3(){
        Decimal distance = 0;
        Decimal minutes = 60;

        Decimal result = Fitness.calculatePace(distance, minutes);
        System.assertEquals(0, result, 'Pace should 0km/hr for 0 km in 60 minutes');
    }

    @isTest
    public static void calculatePace_TestCase4(){
        Decimal distance = -10;
        Decimal minutes = 60;

        Decimal result = Fitness.calculatePace(distance, minutes);
        System.assertEquals(-1, result, 'Invalid input');
    }

    @isTest
    public static void calculatePace_TestCase5(){
        Decimal distance = 10;
        Decimal minutes = -60;

        Decimal result = Fitness.calculatePace(distance, minutes);
        System.assertEquals(-1, result, 'Invalid input');
        
    }

}