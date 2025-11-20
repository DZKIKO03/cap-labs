# CAP CLI – Gestione dei Dati

Questa sezione spiega i comandi principali della CAP CLI relativi alla gestione dei dati nelle applicazioni CAP.

---

## 1. cds add data
Genera automaticamente i file CSV nella cartella:
db/data/

yaml
Copia codice
Ogni file ha formato:
<namespace>-<entity>.csv

yaml
Copia codice
Questi file contengono dati di test preconfigurati.

---

## 2. cds deploy
Esegue il deployment dello schema e dei dati verso un database (SQLite o HANA).  
Importa automaticamente i CSV presenti in `db/data`.

---

## 3. cds import <file>
Permette di importare dati da:

- CSV  
- Excel  
- JSON  
- altri formati supportati

Utile per master data strutturati.

---

## 4. cds pull
Scarica schema o dati da un database esistente in formato CDS.  
Ideale se devi sincronizzare un DB reale con il tuo modello.

---

## 5. cds compile --to sql
Genera il DDL SQL basato sul modello CDS.  
Serve per vedere come CAP traduce le entità in tabelle fisiche.

---
