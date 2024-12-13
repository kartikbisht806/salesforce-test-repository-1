trigger Acc_Creates_Default_Con on Account (after insert) {
    Switch on Trigger.OperationType{
        When AFTER_INSERT{
            Con_on_Acc_creation_trig_logic.createContact(Trigger.new);
        }
    }
}