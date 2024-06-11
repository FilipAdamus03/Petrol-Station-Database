**18.04**
Tworzenie grafu Bazy Danych 
-- Vertabello lub SQL Server Management Studio

### 1. 3/4 strony Zakres i krótki opis systemu 
### 2. Wymagania, skupienie się na tankowaniu paliwa i stacji
### 3. Jak jest zorganizwoana, rodzaje paliwa, ilość dystrybutorów, schemat jak działa np. tankuje później idzie zaplacić (procedura zapłać za paliwo, tankowania itd.)
### 4. Więcej konkretów, mniej lania wody.
**21.05**
Aktualnienia opisów, kodów i samej bazy danych


**DATA 06.06.2024 **

<s>Widok bill_value ---

zamisast petrol.price -> petrol_history.price
poprawić ten widok jest niepoprawny</s>

<s>To samo do widok invoice_details</s>

<s>Do grupowania dodawać klucz główny</s>

<s>Aktywne zniżki - zamiast null można sztucznie zawyżyć datę</s>

<s>Suma obsłużonych transakcji przez pracowników - zamiast widoku to procedura (od - do)</s>

<s>widok 9. lepiej zrobić jak oprocedurę albo funkcjęalbo dodać do widoku daty.</s>

Poprawić PRINT -> throw , pozbyć się printów

schematy TRY CATCH,
ROLLBACK
przy procedurach roczpoczęcie i zakońćzenie tankowania.

6.procedura

ubrać w schemat transakcja.



Dodać "select * from .." przy widokach


**11-06-2024 Filip Przepiórka**
**Update record:**

>Poprawienie danych testowych w tabeli *transaction*

>Nowe dane testowe w tabeli *supply*

>Aktualizacja daty w tabeli *discount*
  >- zamiast null w końcu zniżki, sztucznie zawyżona data końca
    
>Nowe dane testowe w tabeli  *petrol_history*

>Poprawienie widoku *vw_bill_value* żeby brał historyczne ceny dla dat.

>Poprawienie widoku *invoice_details* na takiej samej zasadzie jak *vw_bill_value*

>Grupowanie po kluczach głównych:
  >- *vw_total_year_amount*
  >- *vw_avg_monthly_petrol_price*

>Zmienienie widoku *vw_employee_transaction_count* na procedurę *sp_employee_transaction_count* (od - do)

>Poprawienie widoku *vw_distributor_fuel_usage* - dodanie do niego daty

**11-06-2024 Rafał Dubiel**
>Zmienienie print -> RAISERROR w sp_start_fueling
