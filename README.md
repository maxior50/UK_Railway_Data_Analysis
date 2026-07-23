# 🚆 UK Railway Data Analysis – SQL Case Study

## 📌 O Projekcie
Celem projektu jest przeanalizowanie zbioru danych dotyczącego przewozów kolejowych w Wielkiej Brytanii. Analiza obejmuje kluczowe wskaźniki biznesowe (KPI), optymalizację przychodów, badanie godzin szczytu oraz ocenę punktualności pociągów wraz z identyfikacją głównych przyczyn opóźnień.

---

## ⚙️ Zakres Wykonanej Pracy (Co zostało zrobione)

1. **Przygotowanie Bazy i Import Danych:**
   * Utworzenie bazy danych w **PostgreSQL** oraz zdefiniowanie tabeli `railway` z odpowiednimi typami danych.
   * Import surowych danych z pliku CSV za pomocą narzędzia *Import/Export Data* w pgAdmin 4.

2. **Analiza Kluczowych Metryk Finansowych (KPI):**
   * Wyznaczenie łącznego przychodu oraz średniej ceny biletu przy użyciu funkcji agregujących (`SUM`, `AVG`) i rzutowania typów danych (`::NUMERIC`).

3. **Badanie Obciążenia Sieci (Godziny Szczytu):**
   * Wyekstrahowanie godziny odjazdu z tekstu/czasu (`EXTRACT(HOUR FROM ...)`) w celu wyznaczenia pory dnia o największym natężeniu ruchu pasażerskiego.

4. **Analiza Segmentowa Przychodów:**
   * Grupowanie danych według klasy (`ticket_class`) oraz typu biletu (`ticket_type`) w celu zbadania struktury sprzedaży i efektywności cenowej.

5. **Ocena Punktualności i Identyfikacja Problemów:**
   * Analiza statusów przejazdów z wykorzystaniem funkcji okna (`COUNT(*) OVER ()`) do wyliczenia udziałów procentowych.
   * Wykrycie problemów z jakością danych (*Data Quality / Data Cleaning*) w kolumnie przyczyn opóźnień (np. zduplikowane kategorie wynikające z wielkości liter lub synonimów).

---

## 📊 Kluczowe Wyniki i Raport Biznesowy

### 1. Bezsprzecznym liderem okazała się trasa Manchester Piccadilly $\rightarrow$ Liverpool Lime Street z wynikiem 4628 przejazdów.
Zaraz za nią są połączenia z Londynu do Birmingham i Yorku.

---

### 2. Godziny Szczytu Komunikacyjnego
Analiza wykazuje dwa wyraźne szczyty komunikacyjne odpowiadające dojazdom do i z pracy:
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
* **Spostrzeżenie dotyczące jakości danych:** Występują duplikaty kategorii (np. `Signal Failure` vs `Signal failure` oraz `Staffing` vs `Staff Shortage`). Wymagana jest dalsza standaryzacja tekstowa przy użyciu funkcji `LOWER()` lub `CASE WHEN`.

---

## 🛠️ Użyte Technologie
* **Database:** PostgreSQL 18
* **GUI / Query Tool:** pgAdmin 4
* **Language:** SQL