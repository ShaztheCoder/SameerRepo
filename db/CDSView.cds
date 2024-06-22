namespace shahezad.db;

using { shahezad.db.master, shahezad.db.transaction } from './datamodel';

context CDSView {
    define view![POWorklist]
    as select from transaction.purchaseorder{
        key PO_ID as![PurchaseOrderId],
        PARTNER_GUID.BP_ID as ![partnerId],
        PARTNER_GUID.COMPANY_NAME as ![CompanyName],
        GROSS_AMOUNT as ![POGrossAmount],
        CURRENCY_CODE as ![POCurrencyCode],
        LIFECYCLE_STATUS as ![POStatus],
        key Items.PO_ITEM_POS as ![ItemsPosition],
        PARTNER_GUID.ADDRESS_GUID.CITY as ![City],
        PARTNER_GUID.ADDRESS_GUID.COUNTRY as ![Country],
        Items.GROSS_AMOUNT as ![GrossItemAmount],
        Items.NET_AMOUNT as ![NetItemAmount],
        Items.TAX_AMOUNT as ![TaxItemAmount],
    };

    define view ProductValueHelp
      as select from master.product{
        @EndUserText.label : [
           {
            language: 'EN',
            text: 'Product ID'
           } ,
           {
            language: 'DE',
            text: 'Prodeckt Id'
           }
        ]
        PRODUCT_ID AS![ProductID],
        @EndUserText.label:[
            {
             language: 'EN',
             text: 'Description'   
            },
            {
                language: 'DE',
                text:'Descrepton'
            }
        ]
        DESCRIPTION as![Descr]
      };

      define view![ItemView]
      as select from transaction.poitems{
        PARENT_KEY.PARTNER_GUID.NODE_KEY as![Partner],
        CURRENCY_CODE as![CurrencyCode],
        GROSS_AMOUNT as![GrossAmount],
        TAX_AMOUNT as![TaxAmount],
        NET_AMOUNT as![NetAmount],
        PARENT_KEY.OVERALL_STATUS as![POStatus]        
      };


}
