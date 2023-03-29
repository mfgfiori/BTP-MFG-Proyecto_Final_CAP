using { com.logali as logali} from '../db/schema';

service SalesOrderService {
    entity SalesOrderHeader as projection on logali.SalesOrder.SalesOrderHeader;
    entity SalesOrderItems as projection on logali.SalesOrder.SalesOrderItems;
}
