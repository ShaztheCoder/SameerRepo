using { shahezad.db.master, shahezad.db.transaction } from '../db/datamodel';


service ServiceCatalog @(path: 'SeviceCatalog') {
@Capabilities.Insertable
@Capabilities.Deletable
@Capabilities.Updatable 
entity EmployeeSet as projection on master.employees;
entity AddressSet as projection on master.address;
entity ProductSet as projection on master.product;
entity BPSet as projection on master.businesspartner;

entity POs @( title:'PurchaseOrder')as projection on transaction.purchaseorder{
    *,
    round(GROSS_AMOUNT,2) as GROSS_AMOUNT : Decimal(15,2),
    case LIFECYCLE_STATUS
    when 'N' then 'New'
    when 'D' then 'Delivered'
    when 'B' then 'Blocked'
    end as LIFECYCLE_STATUS : String(20),

    case LIFECYCLE_STATUS
    when 'N' then 2
    when 'D' then 1
    when 'B' then 3
    end as Criticality:Integer,

    Items : redirected to PoItems
}actions{
    function largestOrder() returns array of POs;
    action  boost();    

}

entity PoItems @( title: 'PoItems' ) as projection on transaction.poitems{
    *
};
}