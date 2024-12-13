public with sharing class Opp_CloseDate_notPast_logic {
    public static void validateCloseDate(List<Opportunity> oppList) {
        for(Opportunity opp : oppList){
            if(opp.CloseDate < Date.today()){
                opp.CloseDate.addError('Please enter a future Close Date!');
            }
        }
    }
}