# CAP Labs Repository

This repository contains a collection of exercises, prototypes, and learning projects built with SAP Cloud Application Programming Model (CAP).  
Each project is isolated in its own folder and includes its own data model, service layer, documentation, and technical notes.

## 📁 Repository Structure

cap-labs/
│
├── project-1/
├── project-2/
├── incident-management-cap/
└── ...

markdown
Copia codice

Each project folder includes:

- `/db` – Data model, CDS definitions, CSV test data  
- `/srv` – Services, handlers, custom logic  
- `/docs` – Documentation and diagrams  
- `/screenshots` – UI previews or test outputs  
- `README.md` – Project overview and instructions  
- `README-tech-notes.md` – Technical notes and experiment logs  

## 🎯 Purpose

The goal of this repository is to:
- Practice and learn SAP CAP in a structured way  
- Build a growing library of CAP mini-projects  
- Document technical experiments clearly  
- Maintain clean templates for new projects  

## 📦 Requirements

- Node.js LTS  
- @sap/cds  
- SQLite (local) or SAP HANA Cloud (optional)  
- SAP Business Application Studio or VS Code with CDS tools  

## 🚀 How to Start a Project

To run any project inside this repository:

```bash
cd <project-folder>
npm install
cds watch
📚 Conventions
All documentation is in English.

Project-specific notes stay inside the project folder.

Root README is only for structure and global explanations.

All code comments avoid Unicode characters.

“TAO” is always replaced with 2CMB.
