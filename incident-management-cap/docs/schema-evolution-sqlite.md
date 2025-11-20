# Schema Evolution per SQLite e HANA

Quando si lavora con CAP, è importante capire la differenza tra *drop-create* e *schema evolution*.

---

## 1. Cos’è lo Schema Evolution?
È il meccanismo che evita la perdita di dati quando cambi il modello CDS in un ambiente di produzione.

Con lo schema evolution attivo:
- i dati esistenti vengono preservati  
- vengono aggiunte solo le modifiche necessarie  
- le colonne vengono aggiornate senza perdere i record  

---

## 2. Perché non si usa il drop-create in produzione?
Perché ricrea completamente le tabelle e:

❗ **Elimina tutti i dati esistenti**

---

## 3. Quando si usa Schema Evolution?
- Produzione  
- QA  
- Pre-produzione  

Quando serve preservare i dati del cliente.

---

## 4. Quando NON usarlo
- Durante sviluppo locale  
- Quando cambi spesso il modello  
- Quando usi SQLite in-memory

---

## 5. Attivazione
In SAP HANA Cloud lo schema evolution viene applicato automaticamente durante i deploy produttivi.

---
