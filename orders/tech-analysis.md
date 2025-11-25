# Technical Analysis – Orders CAP Project

## 1. Purpose of the Project

The goal of this project is to implement a simple Orders / OrderItems domain model using SAP Cloud Application Programming Model (CAP).  
This project was created to practice:

- CDS modeling and associations  
- Service-layer projections  
- Custom CAP actions  
- Node.js service handlers  
- CAP Query API (`SELECT`)  
- CSV-based data loading via SQLite  

---

## 2. Data Model Overview

The data model is located in `db/schema.cds`.

### 2.1 Core Entities

#### **Orders**
- `ID` (UUID, key)  
- `customer` (String)  
- `createdAt` (DateTime)  
- `items` → Association to-many `OrderItems`  

#### **OrderItems**
- `ID` (UUID, key)  
- `order` → Association to `Orders`  
- `product` (String)  
- `quantity` (Integer)  
- `price` (Decimal)  

### 2.2 Association Logic

```cds
items : Association to many OrderItems on items.order = $self;

CAP automatically generates the foreign key order_ID inside OrderItems.

3. Service Layer

Defined in srv/orders.cds.

The service exposes:

entity Orders as projection on db.Orders;
entity OrderItems as projection on db.OrderItems;

action calculateTotal(orderID : UUID);
action createdAt();


This is exposed automatically via OData V4 by CAP.

4. Node.js Handlers (Custom Logic)

Implemented in srv/orders.js.

4.1 createdAt Action

Returns the authenticated user performing the request.

srv.on('createdAt', req => {
    return `Operation executed by user: ${req.user.id}`;
});

4.2 calculateTotal Action

Steps performed:

Read the input orderID

Fetch all related OrderItems

Compute total = quantity * price

Return the numeric value

const items = await SELECT.from(OrderItems).where({ order_ID: orderID });

let total = 0;
for (const item of items) {
    total += item.quantity * item.price;
}

return total;


Best Practices

Add validation in case the orderID does not exist

Use DB-level aggregation for production workloads:

SELECT SUM(quantity * price) FROM ...

5. Persistence

SQLite is used in development via @cap-js/sqlite

CSVs in /db are auto-loaded by CAP

6. Manual Testing
Read Orders
GET /odata/v4/orders/Orders

Calculate Total
POST /odata/v4/orders/calculateTotal

Body:
{ "orderID": "<uuid>" }

Get Technical User
POST /odata/v4/orders/createdAt

Screenshots are available in /screenshots.
