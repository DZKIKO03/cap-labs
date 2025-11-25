# Technical Notes – Orders CAP Project

This document contains personal technical notes, experiments, and observations collected during the development of the Orders CAP project.  
It is not meant to be part of the end-user documentation, but rather a development log.

---

## 1. Environment & Tools

- Runtime: Node.js LTS  
- CAP version: `@sap/cds` (auto-resolved from package.json)  
- Persistence: SQLite (`@cap-js/sqlite`)  
- IDE used: VS Code / Business Application Studio  
- Testing: REST client in browser + CAP OData explorer  

---

## 2. CAP Commands Used

### Initialize the project

cds init orders

### Start local development server

cds watch

### View the service catalog

http://localhost:4004

---

## 3. Notes on the Data Model

- Association `Orders -> OrderItems` is implemented as:


---

## 3. Notes on the Data Model

- Association `Orders -> OrderItems` is implemented as:
  
items : Association to many OrderItems on items.order = $self;

- CAP automatically created the foreign key `order_ID` in `OrderItems`.
- CSV files must follow CAP naming conventions:
- `my.orders_customer-Orders.csv`
- `my.orders_customer-OrderItems.csv`

---

## 4. Notes on Service Logic

- `createdAt()` returns the `req.user.id` to understand how CAP manages authentication context locally.
- `calculateTotal()` originally had no validation; adding checks for invalid `orderID` is a recommended improvement.
- CAP Query API:
```js
const items = await SELECT.from(OrderItems).where({ order_ID: orderID });
5. Issues Encountered & Fixes

Issue: CSV files not loading
Fix: Ensure CSV filenames match the namespace + entity name.

Issue: Empty response from custom action
Fix: Missing return in handler; added return total.

Issue: Wrong association direction
Fix: Corrected association condition to items.order = $self.

6. Future Improvements

Add input validation for calculateTotal.

Implement deep insert for Orders + Items.

Add a Fiori preview with cds add fiori.

Add automated tests (Jest or CAP test runner).

Replace manual summation with SQL aggregation.

7. Personal Notes

CAP handles a lot automatically; important to understand the conventions behind entity names, CSV structure, and foreign key generation.

This project is a good reference template for future CAP mini-projects.


