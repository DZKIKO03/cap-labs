# Incident Management CAP Application

This project implements a full Incident Management backend using the SAP Cloud Application Programming Model (CAP). It includes a complete CDS data model, service projections, and generated test data for local development.

---

## 1. Project Structure

```
incident-management-cap/
├── app/
├── db/
│   ├── data/
│   └── schema.cds
├── srv/
│   └── services.cds
├── docs/
│   ├── cap-cli-data.md
│   ├── providing-initial-data.md
│   ├── schema-evolution-sqlite.md
│   └── test-data-considerations.md
├── screenshots/
├── package.json
├── package-lock.json
└── README.md
```

---

## 2. How to Run the Project

### **Install dependencies**

```
npm install
```

### **Start the CAP server in watch mode**

```
cds watch
```

The server will start at:

```
http://localhost:4004
```

---

## 3. Deploy to SQLite

To deploy the data model and import CSV test data:

```
cds deploy --to sqlite
```

This will create or update the SQLite database file.

---

## 4. Exposed Services

The application exposes two OData V4 services:

### **ProcessorService**

```
/odata/v4/processor/Incidents
/odata/v4/processor/Customers
```

### **AdminService**

```
/odata/v4/admin/Incidents
/odata/v4/admin/Customers
```

---

## 5. Data Model Overview

The CDS model includes:

* **Incidents** (with composition to Conversation)
* **Customers** (with composition to Addresses)
* **Addresses**
* **Status** (CodeList)
* **Urgency** (CodeList)

All entities use `cuid` and `managed` aspects for consistent ID and audit fields.

---

## 6. Test Data

CSV files are generated automatically using:

```
cds add data
```

They are located in:

```
db/data/
```

These files are intended **only for local development**.

---

## 7. Important Notes

* Comments in code must always be in **English**.
* Technical documentation inside `/docs` is in **Italian**, as part of your study notes.
* This project is part of the *CAP Labs* portfolio.

---

## 8. Screenshots

Upload the following screenshots inside `/screenshots/`:

* **incidents-response.png** — screenshot of `/odata/v4/processor/Incidents`
* **customers-expand-incidents.png** — screenshot of `/odata/v4/processor/Customers?$select=firstName&$expand=incidents`

---

## 9. Author

Daniele — SAP Technical Architect Path (Piano Amsterdam)

