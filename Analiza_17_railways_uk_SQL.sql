/* ============================================================
   PROJEKT: Analiza danych kolejowych w UK (Railway Dataset)
   AUTOR: Twoje Imię / Analityk Danych
   OPIS: Kompleksowa analiza SQL dotycząca przychodów,
         ruchliwości pasażerów oraz punktualności.
   ============================================================ */

-- 1. Usunięcie starej tabeli
DROP TABLE IF EXISTS railway;

-- 2. Tworzymy tabelę z polami VARCHAR, żeby przyjęła wszystkie puste/specjalne znaki z CSV
CREATE TABLE railway (
    transaction_id VARCHAR(100),
    date_of_purchase VARCHAR(100),
    time_of_purchase VARCHAR(100),
    purchase_type VARCHAR(100),
    payment_method VARCHAR(100),
    railcard VARCHAR(100),
    ticket_class VARCHAR(100),
    ticket_type VARCHAR(100),
    price VARCHAR(100),
    departure_station VARCHAR(100),
    arrival_destination VARCHAR(100),
    date_of_journey VARCHAR(100),
    departure_time VARCHAR(100),
    arrival_time VARCHAR(100),
    actual_arrival_time VARCHAR(100),
    journey_status VARCHAR(100),
    reason_for_delay VARCHAR(200),
    refund_request VARCHAR(100)
);

-- ============================================================
-- PYTANIE 1: Jakie są najpopularniejsze trasy przejazdów?
-- ============================================================

-- 1. Podgląd pierwszych 5 zaimportowanych wierszy
SELECT * FROM railway LIMIT 5;

-- 1. Zliczenie przejazdów dla każdej kombinacji stacji startowej i docelowej
SELECT 
    departure_station,                      -- Stacja początkowa
    arrival_destination,                    -- Stacja docelowa
    COUNT(*) AS liczba_przejazdow           -- Liczba zarejestrowanych przejazdów
FROM 
    railway
GROUP BY 
    departure_station, 
    arrival_destination                     -- Grupowanie według pary stacji
ORDER BY 
    liczba_przejazdow DESC                  -- Sortowanie od najpopularniejszej trasy
LIMIT 10;                                   -- Wyświetlenie TOP 10 tras



-- ============================================================
-- PYTANIE 2: Jakie są godziny szczytu dla podróży koleją?
-- ============================================================

SELECT 
    EXTRACT(HOUR FROM departure_time::TIME) AS godzina,  -- Wyciągnięcie samej godziny z czasu odjazdu
    COUNT(*) AS liczba_przejazdow                       -- Zliczenie liczby odjazdów w danej godzinie
FROM 
    railway
WHERE 
    departure_time IS NOT NULL                           -- Ignorowanie pustych wartości
    AND departure_time != ''
GROUP BY 
    godzina                                              -- Grupowanie według godziny
ORDER BY 
    liczba_przejazdow DESC;                             -- Sortowanie od najbardziej obciążonej godziny

-- ============================================================
-- PYTANIE 3: Jak przychody różnią się w zależności od typu i klasy biletu?
-- ============================================================

SELECT 
    ticket_class,                                       -- Klasa biletu (Standard / First Class)
    ticket_type,                                        -- Typ biletu (Advance / Anytime / Off-Peak)
    SUM(price::NUMERIC) AS calkowity_przychod,          -- Łączna suma przychodów dla danej grupy
    ROUND(AVG(price::NUMERIC), 2) AS srednia_cena       -- Średnia cena biletu w tej grupie
FROM 
    railway
WHERE 
    price IS NOT NULL AND price != ''                  -- Ignorowanie pustych wartości
GROUP BY 
    ticket_class, 
    ticket_type                                         -- Grupowanie po klasie i typie
ORDER BY 
    calkowity_przychod DESC;                            -- Sortowanie od najwyższego przychodu

-- ============================================================
-- PYTANIE 4: Jak wygląda punktualność przejazdów? Jakie są główne przyczyny opóźnień?
-- ============================================================

-- A) Statystyka statusów przejazdu (On Time, Delayed, Cancelled)
SELECT 
    journey_status,                         -- Status przejazdu
    COUNT(*) AS liczba_przejazdow,          -- Liczba kursów
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2
    ) AS procent_calosci                    -- Procentowy udział w całości
FROM 
    railway
GROUP BY 
    journey_status
ORDER BY 
    liczba_przejazdow DESC;


-- B) Główny powód opóźnień
SELECT 
    reason_for_delay,                       -- Powód opóźnienia
    COUNT(*) AS liczba_opoznien
FROM 
    railway
WHERE 
    reason_for_delay IS NOT NULL            -- Filtrujemy tylko opóźnione kursy
    AND reason_for_delay != ''
GROUP BY 
    reason_for_delay
ORDER BY 
    liczba_opoznien DESC;
