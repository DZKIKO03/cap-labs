# Important Considerations for Test Data

Questa sezione spiega i rischi e le linee guida per l’uso dei dati di test nelle applicazioni CAP.

---

## 1. Perché i test data esistono?
I CSV generati automaticamente servono per:
- Popolare SQLite in-memory  
- Fare test locali  
- Eseguire tutorial e training  

---

## 2. Cosa succede durante il deploy?
Ogni `cds deploy` esegue:
- eliminazione tabelle (drop)  
- ricreazione tabelle (create)  
- caricamento CSV  

Questo va bene SOLO in sviluppo.

---

## 3. Rischio critico: perdita di dati in SAP HANA
Se deployi CSV contenenti dati dinamici (es. Customers, Incidents):

❗ **HANA elimina i dati delle tabelle e li sovrascrive**

Anche se cancelli i CSV dal progetto, HANA li memorizza e potrebbe ripristinarli.

---

## 4. Cosa posso deployare in produzione?
Solo:
- Master Data  
- Codici  
- Stati  
- Urgenze  
- Dati statici non modificabili dagli utenti  

---

## 5. Come evitare problemi
- Usa CSV **solo in sviluppo**  
- Evita CSV per entità contenenti dati dei clienti  
- Usa schema evolution in produzione  
- Popola i dati produttivi tramite UI, OData o ETL  

---

## 6. Sintesi finale
I CSV sono strumenti utilissimi per sviluppare, ma **potenzialmente pericolosi** in produzione.  
Usali con criterio e solo nelle fasi corrette del ciclo di vita dell’applicazione.
