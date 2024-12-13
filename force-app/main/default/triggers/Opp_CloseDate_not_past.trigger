trigger Opp_CloseDate_not_past on Opportunity (before insert) {
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            Opp_CloseDate_notPast_logic.validateCloseDate(Trigger.new);
        }
       
    }
}