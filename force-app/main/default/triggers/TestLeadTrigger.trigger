trigger TestLeadTrigger on Lead (before insert, after insert, before update, after update) {
    
    Switch on Trigger.operationType{
        When BEFORE_INSERT{
            Lead_Trigger_Handler.before_Insert_Handler(Trigger.new);
        }
        
        When AFTER_INSERT{
            Lead_Trigger_Handler.after_Insert_Handler(Trigger.new);
        }
        
        when BEFORE_UPDATE{
            Lead_Trigger_Handler.before_Update_Handler(Trigger.new, Trigger.oldMap); 
        }
        
    }
    
}