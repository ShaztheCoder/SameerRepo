using { shahezad.db.master,shahezad.db.transaction } from '../db/datamodel';

service myServDemo{

    function anyone(msg: String) returns String;

    @insertonly
    entity employeeInsertSet as projection on master.employees;
    @readonly
    entity employeeReadSet as projection on master.employees;
    @Capabilities.Updatable
    entity employeeUpdateSet as projection on master.employees;
    @Capabilities.Deletable
    entity employeeDeleteSet as projection on master.employees;

}