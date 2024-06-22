using { shahezad.db.CDSView } from '../db/CDSView';

service CDSService {

    entity POWorklist as projection on CDSView.POWorklist;

    entity ProductVH as projection on CDSView.ProductValueHelp;

    entity ItemView as projection on CDSView.ItemView;

}