// nome del pacchetto
namespace my.orders_customer;

entity Orders {
@title : 'Key'
key ID : UUID;
@title : 'Customer'
customer : String(16);
@title : 'Creation Date'
createdAt : DateTime;
@title : 'Items'
items : Association to many OrderItems on items.order = $self;
};

entity OrderItems {
@title : 'Key'    
KEY ID : UUID;
@title : 'Order'
order : Association to Orders;
@title : 'Product'
product : String(80);
@title : 'Quantity'
quantity : Int32;
@title : 'Price'
price : Decimal(9,2)
}

