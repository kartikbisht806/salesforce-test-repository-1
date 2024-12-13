public with sharing class Product_Controller_cls {
    public static void triggerLogic(List<Product2> productList) {
        List<PricebookEntry> pbeList = new List<PricebookEntry>();
            List<Pricebook2> priceBookID = [SELECT Id FROM Pricebook2 WHERE IsStandard = true LIMIT 1];
            //Pricebook2Id = priceBookID[0].Id
            for(Product2 p : productList){
                PricebookEntry pbe = new PricebookEntry(
                    Product2Id = p.Id,
                    Pricebook2Id = priceBookID[0].Id,
                    UnitPrice = 1,
                    CurrencyIsoCode = 'USD',
                    IsActive = true
                );
                pbeList.add(pbe);
            }
            insert pbeList;
    }
}