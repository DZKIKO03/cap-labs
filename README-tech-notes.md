Incident Management CAP – Technical Notes

This document provides a deep technical analysis of the Incident Management CAP application. It is intended for architectural review, portfolio presentation, and interview preparation.

1. Architectural Overview

This project implements a backend for managing customer incidents by leveraging the SAP Cloud Application Programming Model (CAP).
The architecture follows the canonical CAP structure:

Data Model (CDS): entities, associations, compositions, CodeLists

Service Layer (CSN/OData): projections exposed via OData V4

Test Data Layer: CSV-based initial data for local development

Runtime Layer: Node.js with SQLite (in-memory or file-based)

This structure provides a clean separation between persistence, service logic, and API exposure, reflecting SAP BTP best practices.

2. Data Model Analysis
2.1 Core Entities

The data model includes the following core domain entities:

Incidents

Represents a support incident created by a customer

Uses cuid and managed for automatic ID and audit fields

Includes a composition to embedded Conversation entries

Customers

Contains personal and contact information

Maintains a one-to-many association to Incidents

Contains a composition to the Addresses child entity

Addresses

Child entity linked to Customers

Uses managed aspects for audit trails

2.2 CodeList Entities

Status

Urgency

Both implement SAP’s standardized CodeList aspect.
This ensures automatic handling of:

Code-value mappings

Text handling (via <entity>.texts)

Internationalization support

2.3 Associations & Compositions

The model uses:

Associations

Between Customers and Incidents

Between Incidents and Status/Urgency

Compositions

Incidents → Conversation

Customers → Addresses

This ensures proper cascading delete and encapsulation of dependent records.

3. Service Layer

Two services are defined:

3.1 ProcessorService

Exposes:

Incidents

Customers (read-only)

Designed for the support team who resolves incidents.

3.2 AdminService

Exposes:

Customers

Incidents

Designed for administrative staff managing master data and incident lifecycle.

Both services are automatically exposed as OData V4:

/odata/v4/processor/
/odata/v4/admin/


This enables seamless integration with SAP Fiori Elements, UI5, and external systems.

4. Test Data and Deployment Model

The project uses CSV-based initial data generated via:

cds add data


This creates data files for each entity:

sap.capire.incidents-Incidents.csv
sap.capire.incidents-Customers.csv
...


These files are imported when running:

cds deploy --to sqlite

⚠️ Important Considerations

CSVs work perfectly for development

MUST NOT be deployed to SAP HANA production

Production requires schema evolution, not drop-create

Only master data is safe for CSV deployment

This aligns with CAP’s recommended separation of test data, master data, and customer data.

5. Runtime Behavior
5.1 Development Mode (Watch Mode)
cds watch


Uses SQLite in-memory

Reloads on file changes

Re-imports CSVs on each run

Suitable for iterative modeling

5.2 Persistent Mode (SQLite file)
cds deploy --to sqlite


Creates a real .sqlite file

Imports all test data from db/data

Useful for debugging before deploying to BTP

6. Deployment Readiness

This project is structured for a standard CAP deployment pipeline:

What is already compliant:

✔ Standard CAP folder structure
✔ Clean CDS modularization
✔ Proper namespaces
✔ Separation between db, srv, docs, screenshots
✔ English comments in code
✔ Italian documentation for study purposes
✔ Valid OData endpoints
✔ Test data support (CSV)

What can be added later:

CAP authorization (roles, privileges)

Fiori Elements UI (cds add fiori)

CAP handlers (Node.js service extensions)

Deployment to SAP BTP Cloud Foundry

Usage of HANA Cloud instead of SQLite

7. Interview-Ready Talking Points

You can confidently articulate the following points during a technical interview:

Understanding of CAP's layered architecture

Ability to model entities, CodeLists, and compositions

Knowledge of OData V4 service exposure

Practical management of test data vs. production data

Awareness of schema evolution in HANA

Experience running CAP locally with watch mode

Exporting and deploying to SQLite

Clean, consistent project structuring for GitHub portfolio

8. Conclusion

This project demonstrates solid proficiency in CAP fundamentals and reflects the development quality expected from a future SAP Technical Architect.

It is fully suitable for:

GitHub portfolio

Recruiter technical reviews

Certification preparation

Practice before real-world CAP projects
