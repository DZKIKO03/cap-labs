# Orders – CAP Project

This project implements a simple Orders Management domain using the SAP Cloud Application Programming Model (CAP).  
It demonstrates CDS modeling, service projections, custom actions, and Node.js event handlers.

## Features

- CDS data model including:
  - `Orders` entity with association to `OrderItems`
  - `OrderItems` entity with quantity, price, and product details
- Custom actions:
  - `calculateTotal(orderID)` → returns the total amount of an order
  - `createdAt()` → returns the current authenticated technical user
- Sample CSV data for local testing
- SQLite persistence for development

## Project Structure

orders/
├── db
│ ├── schema.cds
│ ├── my.orders_customer-Orders.csv
│ └── my.orders_customer-OrderItems.csv
├── srv
│ ├── orders.cds
│ └── orders.js
├── docs
│ ├── tech-analysis.md
│ └── domain-model.png
├── screenshots
│ ├── service-catalog.png
│ ├── calculate-total.png
│ └── cds-watch.png
├── package.json
├── package-lock.json
└── README.md

perl
Copia codice

## How to Run

```bash
npm install
cds watch
API Test Examples
Retrieve Orders
bash
Copia codice
GET http://localhost:4004/odata/v4/orders/Orders
Calculate Order Total
bash
Copia codice
POST http://localhost:4004/odata/v4/orders/calculateTotal
Body:
{
  "orderID": "<uuid>"
}
Get Technical User
bash
Copia codice
POST http://localhost:4004/odata/v4/orders/createdAt
Screenshots
See /screenshots for:

Service Catalog

Custom action tests

cds watch logs

yaml
Copia codice

---

# ✅ **2. `docs/tech-analysis.md` (Technical Analysis in English)**

```md
# Technical Analysis – Orders CAP Project

## 1. Project Purpose

This project implements a minimal Orders / OrderItems domain model to practice:
- CDS modeling and associations
- Service-layer projections
- Custom actions in CAP services
- Node.js event handlers
- Executing CAP Query API (`SELECT`)
- Working with CSV-based mock data

---

## 2. Data Model Overview

The data model is defined in `db/schema.cds`.

### 2.1 Entities

### **Orders**
- `ID` (UUID, key)
- `customer` (String)
- `createdAt` (DateTime)
- `items` (Association to-many `OrderItems`)

### **OrderItems**
- `ID` (UUID, key)
- `order` (Association to `Orders`)
- `product` (String)
- `quantity` (Int32)
- `price` (Decimal)

### 2.2 Association Logic

```cds
items : Association to many OrderItems on items.order = $self;
CAP automatically generates the foreign key order_ID in OrderItems.

3. Service Layer (srv)
The service definition in srv/orders.cds exposes:

entity Orders as projection on db.Orders

entity OrderItems as projection on db.OrderItems

action calculateTotal(orderID : UUID)

action createdAt()

The service is exposed as an OData V4 endpoint using CAP defaults.

4. Custom Logic (Node.js Handlers)
Handlers are implemented in srv/orders.js.

4.1 Handler: createdAt
Returns the authenticated user performing the request.

js
Copia codice
srv.on('createdAt', req => {
    return `Operation executed by user: ${req.user.id}`;
});
4.2 Handler: calculateTotal
This action:

Retrieves the input orderID

Loads the related order items using CAP Query API

Calculates total = quantity * price

Returns the computed value

Code logic:

js
Copia codice
const items = await SELECT.from(OrderItems).where({ order_ID: orderID });
let total = 0;
for (const item of items) {
    total += item.quantity * item.price;
}
return total;
Notes & Best Practices
Consider adding validation when orderID does not exist.

In a production scenario, the total should be computed via SQL aggregation for performance:

sql
Copia codice
SELECT sum(quantity * price) ...
5. Persistence Layer
Local development uses SQLite via @cap-js/sqlite.

Mock CSV data is located in the db/ folder and automatically loaded by CAP.

6. Manual Testing Scenarios
Test 1 – Read Orders
bash
Copia codice
GET /odata/v4/orders/Orders
Test 2 – Execute calculateTotal
bash
Copia codice
POST /odata/v4/orders/calculateTotal
{
  "orderID": "<uuid>"
}
Test 3 – Get technical user
bash
Copia codice
POST /odata/v4/orders/createdAt
Screenshot outputs are available in /screenshots.
