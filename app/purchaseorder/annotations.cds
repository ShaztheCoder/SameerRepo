using ServiceCatalog as service from '../../srv/ServiceCatalog';

annotate service.POs with @(
    UI: {
        SelectionFields : [
            PO_ID,
            GROSS_AMOUNT,
           LIFECYCLE_STATUS,
            CURRENCY_CODE
        ] , 
        
        LineItem : [
            {
                $Type : 'UI.DataField',
                Value : PO_ID
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.COMPANY_NAME
            },
            {
                $Type : 'UI.DataFieldForAction',
                Label : 'Boost',
                Action : 'ServiceCatalog.boost',
                Inline : true
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_CODE
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
                Criticality: Criticality,
                CriticalityRepresentation: #WithIcon
            }
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : '{i18n>PurchaseOrder}',
            TypeNamePlural : '{i18n>PurchaseOrders}',
            Title : {
                Label : '{i18n>POID}',
                Value : PO_ID
            },
            Description : {
                Label : '{i18n>DESC}',
                Value : PARTNER_GUID.COMPANY_NAME
            }
        }
    }

);

