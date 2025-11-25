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


## How to Run

```bash
npm install
cds watch

API Test Examples
Retrieve Orders
GET http://localhost:4004/odata/v4/orders/Orders

Calculate Order Total
POST http://localhost:4004/odata/v4/orders/calculateTotal


Body:

{
  "orderID": "<uuid>"
}

Get Technical User
POST http://localhost:4004/odata/v4/orders/createdAt

Screenshots

See /screenshots for:

Service Catalog

Custom action tests

cds watch logs
