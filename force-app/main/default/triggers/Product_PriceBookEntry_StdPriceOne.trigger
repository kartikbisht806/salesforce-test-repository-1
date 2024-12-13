trigger Product_PriceBookEntry_StdPriceOne on Product2 (after insert) {
    switch on Trigger.operationType {
        when AFTER_INSERT{
            Product_Controller_cls.triggerLogic(Trigger.new);
        }
        
    }
}