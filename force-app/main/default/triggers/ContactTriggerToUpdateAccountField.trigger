trigger ContactTriggerToUpdateAccountField on Contact (After insert, after update, after delete, after undelete) {
    Switch on Trigger.OperationType{
        When AFTER_INSERT{
            Contact_Trigger_Handler.after_insert(Trigger.new);
            
        }

        When AFTER_UPDATE{
            Contact_Trigger_Handler.after_update(Trigger.new, Trigger.oldMap);
        }

        When AFTER_DELETE{
            Contact_Trigger_Handler.after_delete(Trigger.old);
        }

        When AFTER_UNDELETE{
            Contact_Trigger_Handler.after_undelete(Trigger.new);
        }
    }

}