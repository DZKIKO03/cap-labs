using my.orders_customer as db from '../db/schema';

service orders {
    entity Orders as projection on db.Orders;
    entity OrderItems as projection on db.OrderItems;

    action calculateTotal(orderID : UUID) returns Decimal(9,2);
    action createdAt() returns String;
}
