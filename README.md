# 🚆 UK Railway Data Analysis – SQL Project

## 📌 O Projekcie
Celem projektu jest przeanalizowanie zbioru danych dotyczącego przewozów kolejowych w Wielkiej Brytanii. Analiza obejmuje kluczowe wskaźniki biznesowe (KPI), optymalizację przychodów, badanie godzin szczytu oraz ocenę punktualności pociągów wraz z identyfikacją głównych przyczyn opóźnień.

---

## 📊 Kluczowe Wyniki i Raport Biznesowy

### 1. Ogólne Wyniki Finansowe
* **Całkowity Przychód:** **741 921,00 £**
* **Średnia Cena Biletu:** **23,44 £**

---

### 2. Godziny Szczytu Comunicacyjnego
Analiza wykazuje wyraźne dwa szczyty komunikacyjne odpowiadające dojazdom i powrotom z pracy:
* **Szczyt popołudniowy (najwyższy):** 
  * Godzina **18:00** – 3 113 przejazdów
  * Godzina **17:00** – 2 888 przejazdów
* **Szczyt poranny:** 
  * Godzina **06:00** – 3 112 przejazdów
  * Godzina **07:00** – 2 795 przejazdów

---

### 3. Analiza Przychodów wg Klasy i Typu Biletu
* **Standard Class (Advance):** Generuje największy przychód łączny (**242 369 £**) przy relatywnie niskiej średniej cenie biletu (**15,34 £**). Wskazuje to na duży wolumen sprzedaży biletów kupowanych z wyprzedzeniem.
* **First Class (Anytime):** Osiąga najwyższą średnią cenę biletu (**77,23 £**), lecz generuje najniższy łączny przychód (**37 841 £**).

---

### 4. Punktualność i Przyczyny Opóźnień (Jakość Danych)
* **Główny powód opóźnień:** Warunki atmosferyczne (*Weather*) stanowią najczęstszą przyczynę przestojów w ruchu.
* **Problemy techniczne:** Awarie infrastruktury (*Signal Failure*) oraz usterki pociągów (*Technical Issue*) stanowią drugi największy obszar opóźnień.
* **Spostrzeżenie dotyczące jakości danych (Data Cleaning):** Występują duplikaty kategorii wynikające z wielkości liter lub synonimów (np. `Signal Failure` vs `Signal failure` oraz `Staffing` vs `Staff Shortage`). Wymagana jest dalsza standaryzacja tekstowa przy użyciu skryptów czyszczących.

---

## 🛠️ Użyte Technologie
* **Database:** PostgreSQL 18
* **GUI / Query Tool:** pgAdmin 4
* **Language:** SQL