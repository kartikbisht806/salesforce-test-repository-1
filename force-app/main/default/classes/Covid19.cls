public class Covid19 {
	private integer recoveredInArea = 0;
    public static integer recoveredInCountry = 0;
    
    //parameterised constructor to set class variables
    public Covid19(Integer recoveredInArea){
        if(recoveredInArea < 0){
            this.recoveredInArea = 0;
        }else{
            this.recoveredInArea = recoveredInArea;
        recoveredInCountry += recoveredInArea;
        }
        
    }
    
    public void treatPatient(){
        recoveredInArea++;
        recoveredInCountry++;
    }
    
    public integer getTreated(){
        return recoveredInArea;
    }
}