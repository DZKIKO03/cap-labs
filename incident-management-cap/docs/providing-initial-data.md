# Providing Initial Data

Questa sezione spiega come CAP gestisce i dati iniziali tramite file CSV.

---

## 1. Cosa sono i dati iniziali?
I dati iniziali sono file CSV salvati nel percorso:
db/data/

yaml
Copia codice
Servono per:
- Popolare il database durante lo sviluppo  
- Eseguire test locali  
- Definire valori di base (stati, codifiche…)

---

## 2. Nome dei file
Il nome deve seguire esattamente questo formato:
<namespace>-<entity>.csv

yaml
Copia codice

---

## 3. Import automatico dei CSV
Quando esegui:
cds deploy

yaml
Copia codice
CAP:
- crea tabelle e viste  
- importa automaticamente i CSV  

---

## 4. Quando NON usare i CSV
I CSV **non devono essere usati in produzione** per tabelle contenenti dati dinamici come:

- clienti  
- ordini  
- incidenti  
- documenti  

Il motivo è che i CSV causano **drop-create** e quindi perdita di dati.

---

## 5. Quando usarli
I CSV sono sicuri solo per:

- Master Data statici  
- Codici fissi  
- Stati  
- Urgenze  
- Liste valori  

---
