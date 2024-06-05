<!-- <style>
 p,li {
    font-size: 12pt;
  }
</style>  -->

<!-- <style>
 pre {
    font-size: 8pt;
  }
</style>  -->


---


**Temat:**
System do obsługi stacji benzynowej

**Autorzy:** 

Filip Przepiórka.
Rafał Dubiel, 
Daniel Antolak, 
Filip Adamus.

--- 

# 1.  Zakres i krótki opis systemu

Projekt ma na celu stworzenie systemu do obsługi procesu tankowania na stacji benzynowej. W projektowanej bazie danych będą rejestrowane wszelkie informacje, wymagane do poprawnego funkcjonowania stacji. 
Wszystkie rekordy będą odpowiednio zapisywane w utworzonych tabelach pod unikalnymi wierszami. Dodatko w systemie zostaną zaimplementowanych funkcje, widoki, procedury,
mające na celu ułatwnienie czynności związanych z obsługą stacji oraz prowadzeniem analizy danych.

Klient przyjeżdża na stacje paliw, wybiera odpowiedni, czynny dystrybutor i rodzaj paliwa, które chce zatankować. Wybranie nieczynnego dystrybutora, uniemożliwi kontynuowanie procesu.
Podnosi pistolet i zaczyna proces tankowania. Po zakończeniu czynności, musi odłożyć pistolet na swoje miejsce. Bez zakończenia procesu, klient nie może zapłacić za zatankowane paliwo.
Odłożenie pistoletu jest wyznacznikiem zakończenia tankowania. Po odłożeniu, klient może przystąpić do płacenia.
Po opłaceniu rachunku przez klienta, zapisana zostanie kwota transakcji, przyznana zniżka , którą klient może posiadać, data, numer dystrybutora z którego pobrano paliwo, 
pracownika który obsłużył zamówienie oraz numer samochodu.
Klient ma możliwość zakupu paliwa na paragon lub fakturę. Do wzięcia faktury system wymaga wprowadzenia numeru NIP. 
Klient może podać numery rejestracyjne pojazdu, nie jest to jednak wymogiem.

System będzie pozwalał na manipulacje cenami paliwa przez pracowników, otrzymanych od
członka zarządu stacji.
Zmiany cen paliwa są rejestrowane w bazie wraz z datami, w których te zmiany zostały wprowadzone.

System przechowywać będzie informacje na temat
dostawców paliwa, dystrybutorów, klientów, transakcji oraz pracowników stacji. Będzie możliwość
generowania raportów oraz zarządzania transakcjami. System będzie
dostępny dla pracowników stacji paliw oraz właścicieli.




# 2.	Wymagania i funkcje systemu

System powinien rejestrować wszystkie informacje dotyczące sprzedaży paliwa, klientów, pracowników, dostaw, rozliczeń. 

System powinien zawierać odpowiednie procedury, widoki i funkcje służące organizacji, analizie i zarządzaniu bazą danych. 

System powinien umożliwiać zapisanie danych firmy do faktury poprzez unikalny numer NIP, aby przyspieszyć proces przy następnej sprzedaży.

Jako klient, chcę mieć możliwość otrzymania faktury lub paragonu za kupione paliwo.

Jako klient, chcę mieć możliwość wyboru co do podawania numeru rejestracyjnego do faktury.

Jako sprzedawca chcę mieć możliwość uzyskania raportu sprzedaży z konkretnego dnia.

System powinien rejestrować dostawy paliwa wraz z konkretną datą, ceną, ilością i typem paliwa oraz dostawcą.

System powinien rejestrować jaki typ paliwa jest tankowany.

System powinien dać możliwość wygenerowania wszystkich informacji z konkretnych sprzedaży.

System powinien umożliwić monitorowanie zapasów paliwa.

System powinien rejestrować zmiany cen paliwa.

Jako pracownik, chcę wiedzieć jaka cena paliwa była w określonym dniu.

# 3.	Projekt bazy danych

## Diagram przedstawiający schemat bazy danych

![image](https://github.com/fprzepio/Petrol-station-Database/assets/132128402/d5a1dede-882c-412a-9710-5fbebf36e515)


## Opis poszczególnych tabel

<br>

Nazwa tabeli: petrol_history
- Opis: Tabela przechowująca historię cen paliwa.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| petrol_history_id | int | PK, Numer ID historii paliwa |
| petrol_id | int |FK do tabeli petrol, Numer ID paliwa |
| price | money | Historyczna cena paliwa za litr |
| date | datetime | Data |

<br>

Nazwa tabeli: petrol
- Opis: Tabela zawierająca informacje o paliwach.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| petrol_id | int | PK, Numer ID paliwa |
| name | varchar(50) | Nazwa paliwa |
| in_stock | float | Aktualny stan paliwa w litrach |
| price | money | Aktualna cena paliwa za litr |

<br>

Nazwa tabeli: supplier
- Opis: Tabela zawierająca dokładne dane dostawców paliwa.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| supplier_id | int | PK, Numer ID dostawcy |
| company_name | varchar(50) | Nazwa dostawcy |
| postal_code | varchar(10) | Kod pocztowy |
| address | varchar(50) | Adres siedziby firmy |
| city | varchar(30) | Miasto dostawcy |
| country | varchar(30) | Państwo dostawcy |
| phone | varchar(20) | Numer telefonu dostawcy |

<br>

Nazwa tabeli: supply
- Opis: Tabela zawierająca dane na temat dostaw.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| supply_id | int | PK, Numer ID Dostawy |
| supplier_id | int | FK do tabeli supplier, Numer ID dostawcy |
| amount | float | Ilość dostarczonego paliwa w litrach |
| date | datetime | Data dostawy |
| petrol_id | int | FK do tabeli petrol, Numer ID paliwa |
| price | money | Cena paliwa za litr |

<br>

Nazwa tabeli: pump
- Opis: Tabela reprezentująca konkretne pistolety paliwa oraz ich dystrybutory.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| pump_id | int | PK, Numer ID pistoletu |
| petrol_id | int | FK do tabeli petrol, Numer ID paliwa |
| distributor_no | int | Numer dystrybutora |
| status | varchar(50) | Status pompy |

<br>

Nazwa tabeli: transaction
- Opis:  Tabela zawierające informacje o transakcjach kupna.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| transaction_id | int | PK, Numer ID transakcji |
| pump_id | int | FK do tabeli pump, Numer ID pistoletu |
| amount | float | Ilość zakupionego paliwa |
| employee_id | int | FK do tabeli employee, Numer ID pracownika |
| date | datetime | Data transakcji |
| discount_id | int | Numer ID rabatu (zezwala na wartość NULL) |

<br>

Nazwa tabeli: employee
- Opis: Tabela zawierająca informacje o pracownikach.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| employee_id | int | PK, Numer ID pracownika |
| firstname | varchar(30) | Imię pracownika |
| lastname | varchar(30) | Nazwisko pracownika |
| title | varchar(20) | Stanowisko pracownika |
| address | varchar(20) | Adres pracownika |
| city | varchar(20) | Miasto pracownika |
| postal_code | varchar(10) | Kod pocztowy |
| country | varchar(20) | Państwo pracownika |
| phone | varchar(20) | Numer telefonu |

<br>

Nazwa tabeli: invoice
- Opis: Tabela zawierająca dane faktur.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| invoice_id | int | PK, Numer ID faktury |
| transaction_id | int | FK do tabeli transaction, Numer ID transakcji |
| NIP | varchar(10) | Numer NIP firmy |
| plate | varchar(20) | Numer rejestracyjny (zezwala na wartość NULL) |

<br>

Nazwa tabeli: discount
- Opis: Tabela zawierająca specyfikację rabatów.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| discount_id | int | PK, Numer ID rabatu |
| discount_name | varchar(50) | Nazwa rabatu |
| value | float | Wartość rabatu |
| start_date | datetime | Data rozpoczęcia zniżki |
| end_date | datetime | Data zakończenia zniżki (zezwala na wartość NULL) |



<br>

Nazwa tabeli: distributor
- Opis: Tabela zawierająca informację o dystrybutorach.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| distributor_no | int | PK, Numer dystrybutora |
| status | varchar(50) | Status dystrybutora |


<br>



# 4.	Implementacja

## Kod poleceń DDL

(dla każdej tabeli należy wkleić kod DDL polecenia tworzącego tabelę)

<br>
Tabela: discount
<br>

```sql
CREATE TABLE dbo.discount (
	discount_id INT NOT NULL,
	discount_name VARCHAR(50) NOT NULL,
	value FLOAT NOT NULL,
	start_date datetime NOT NULL,
	end_date datetime NULL,
	CONSTRAINT PK_discount PRIMARY KEY CLUSTERED (discount_id ASC)
) ON [PRIMARY];

```
<br>
Tabela: distributor
<br>

```sql
CREATE TABLE dbo.distributor (
	distributor_no INT NOT NULL,
	status VARCHAR(50) NOT NULL,
	CONSTRAINT PK_distributor PRIMARY KEY CLUSTERED (distributor_no ASC)
) ON [PRIMARY];

```
<br>
Tabela: employee
<br>

```sql
CREATE TABLE dbo.employee (
	employee_id INT NOT NULL,
	firstname VARCHAR(30) NOT NULL,
	lastname VARCHAR(30) NOT NULL,
	title VARCHAR(20) NOT NULL,
	address VARCHAR(20) NOT NULL,
	city VARCHAR(20) NOT NULL,
	postal_code VARCHAR(10) NOT NULL,
	country VARCHAR(20) NOT NULL,
	phone VARCHAR(20) NOT NULL,
	CONSTRAINT PK_employee PRIMARY KEY CLUSTERED (employee_id ASC)
) ON [PRIMARY];

```
<br>
Tabela: invoice
<br>

```sql
CREATE TABLE dbo.invoice (
	invoice_id INT NOT NULL,
	transaction_id INT NOT NULL,
	NIP VARCHAR(10) NOT NULL,
	plate VARCHAR(20) NULL,
	CONSTRAINT PK_invoice PRIMARY KEY CLUSTERED (invoice_id ASC)
) ON [PRIMARY];

ALTER TABLE dbo.invoice WITH CHECK ADD CONSTRAINT FK_invoice_transaction FOREIGN KEY (transaction_id) 
REFERENCES dbo.transaction (transaction_id);

ALTER TABLE dbo.invoice CHECK CONSTRAINT FK_invoice_transaction;


```
<br>
Tabela: petrol
<br>

```sql
CREATE TABLE dbo.petrol (
	petrol_id INT NOT NULL,
	name VARCHAR(50) NOT NULL,
	in_stock FLOAT NOT NULL,
	price MONEY NOT NULL,
	CONSTRAINT PK_petrol PRIMARY KEY CLUSTERED (petrol_id ASC)
) ON [PRIMARY];


```
<br>
Tabela: petrol_history
<br>

```sql
CREATE TABLE dbo.petrol_history (
	petrol_history_id INT NOT NULL,
	petrol_id INT NOT NULL,
	price MONEY NOT NULL,
	[date] DATETIME NOT NULL,
 CONSTRAINT PK_petrol_history PRIMARY KEY CLUSTERED (petrol_history_id ASC)
) ON [PRIMARY];

ALTER TABLE dbo.petrol_history  WITH CHECK ADD CONSTRAINT FK_petrol_history_petrol FOREIGN KEY(petrol_id)
REFERENCES dbo.petrol (petrol_id)

ALTER TABLE dbo.petrol_history CHECK CONSTRAINT FK_petrol_history_petrol

```
<br>
Tabela: pump
<br>

```sql
CREATE TABLE dbo.pump (
	pump_id INT NOT NULL,
	petrol_id INT NOT NULL,
	distributor_no INT NOT NULL,
	status VARCHAR(50) NOT NULL,
	CONSTRAINT PK_pump PRIMARY KEY CLUSTERED (pump_id ASC)
) ON [PRIMARY];

ALTER TABLE dbo.pump WITH CHECK ADD CONSTRAINT FK_pump_distributor FOREIGN KEY(distributor_no)
REFERENCES dbo.distributor (distributor_no);

ALTER TABLE dbo.pump CHECK CONSTRAINT FK_pump_distributor;

ALTER TABLE dbo.pump WITH CHECK ADD CONSTRAINT FK_pump_petrol FOREIGN KEY(petrol_id)
REFERENCES dbo.petrol (petrol_id);

ALTER TABLE dbo.pump CHECK CONSTRAINT FK_pump_petrol;

```

<br>
Tabela: supplier
<br>

```sql
CREATE TABLE dbo.supplier (
	supplier_id INT NOT NULL,
	company_name VARCHAR(50) NOT NULL,
	postal_code VARCHAR(10) NOT NULL,
	address VARCHAR(50) NOT NULL,
	city VARCHAR(30) NOT NULL,
	country VARCHAR(30) NOT NULL,
	phone VARCHAR(20) NOT NULL,
	CONSTRAINT PK_supplier PRIMARY KEY CLUSTERED (supplier_id ASC)
) ON [PRIMARY];
```

<br>
Tabela: supply
<br>

```sql
CREATE TABLE dbo.supply (
	supply_id INT NOT NULL,
	supplier_id INT NOT NULL,
	amount FLOAT NOT NULL,
	[date] DATETIME NOT NULL,
	petrol_id INT NOT NULL,
	price MONEY NOT NULL,
	CONSTRAINT PK_supply PRIMARY KEY CLUSTERED (supply_id ASC)
) ON [PRIMARY];

ALTER TABLE dbo.supply WITH CHECK ADD CONSTRAINT FK_supply_petrol FOREIGN KEY(petrol_id)
REFERENCES dbo.petrol (petrol_id);

ALTER TABLE dbo.supply CHECK CONSTRAINT FK_supply_petrol;

ALTER TABLE dbo.supply WITH CHECK ADD CONSTRAINT FK_supply_supplier FOREIGN KEY(supplier_id)
REFERENCES dbo.supplier (supplier_id);

ALTER TABLE dbo.supply CHECK CONSTRAINT FK_supply_supplier;

```

<br>
Tabela: transaction
<br>

```sql
CREATE TABLE dbo.transaction (
	transaction_id INT NOT NULL,
	pump_id INT NOT NULL,
	amount FLOAT NOT NULL,
	employee_id INT NOT NULL,
	[date] DATETIME NOT NULL,
	discount_id INT NULL,
	CONSTRAINT PK_transaction PRIMARY KEY CLUSTERED (transaction_id ASC)
) ON [PRIMARY];

ALTER TABLE dbo.transaction WITH CHECK ADD CONSTRAINT FK_transaction_discount FOREIGN KEY(discount_id)
REFERENCES dbo.discount (discount_id);

ALTER TABLE dbo.transaction CHECK CONSTRAINT FK_transaction_discount;

ALTER TABLE dbo.transaction WITH CHECK ADD CONSTRAINT FK_transaction_Employee FOREIGN KEY(employee_id)
REFERENCES dbo.employee (employee_id);

ALTER TABLE dbo.transaction CHECK CONSTRAINT FK_transaction_Employee;

ALTER TABLE dbo.transaction WITH CHECK ADD CONSTRAINT FK_transaction_pump1 FOREIGN KEY(pump_id)
REFERENCES dbo.pump (pump_id);

ALTER TABLE dbo.transaction CHECK CONSTRAINT FK_transaction_pump1;

```

## Widoki

(dla każdego widoku należy wkleić kod polecenia definiującego widok wraz z komentarzem)

**1. Wartość całkowita każdej transakcji**

Widok "vw_bill_value" służy do wyliczenia i zaprezentowania całkowitej wartości każdej transakcji klienta.
Uwzględnione zostały również takie wytyczne jak numer transakcji czy ilość zatankowanego paliwa. W cenę
uwzględniona jest zniżka w miejscach gdzie ona widnieje. (FP)

```sql
create view vw_bill_value AS
SELECT
  t.transaction_id,
  t.pump_id,
  t.employee_id,
  p.name,
  t.amount,
  p.price,
  d.value as discount,
  ROUND(t.amount * p.price *
  CASE
  WHEN d.value IS NULL THEN 1
  ELSE (1-d.value)
  END
  ,2) as bill_value
FROM [transaction] t
LEFT JOIN discount d ON d.discount_id = t.discount_id
JOIN pump ON pump.pump_id = t.pump_id
JOIN petrol p ON p.petrol_id = pump.petrol_id;
```

**2. Całkowity koszt dostawy**

Widok "vw_total_supply_cost" służy do wyliczenia i zaprezentowania całkowitego kosztu każdej dostawy paliwa.
Uwzględnia on również takie informacje jak nazwa dostawcy, adres, miasto, kraj oraz telefon kontaktowy.
Zawiera także szczegóły dotyczące dostarczanego paliwa, takie jak jego nazwa, cena jednostkowa oraz całkowita ilość dostarczonego paliwa. (FA)

```sql
CREATE VIEW vw_total_supply_cost AS
SELECT 
    s.supply_id,
    s.amount,
    s.date,
    p.name AS petrol_name,
    p.price AS unit_price,
    (s.amount * p.price) AS total_cost,
    supp.company_name,
    supp.address AS supplier_address,
    supp.city AS supplier_city,
    supp.country AS supplier_country,
    supp.phone AS supplier_phone
FROM supply s
JOIN petrol p ON s.petrol_id = p.petrol_id
JOIN supplier supp ON s.supplier_id = supp.supplier_id;
```

**3. Status dystrybutorów i pistoletów**

Widok "vw_distributor_pump_status" służy do prezentowania statusu dystrybutorów oraz przypisanych do nich pistoletów.
Uwzględnia on również informacje o rodzaju paliwa oraz cenie.
Widok ten może być używany do monitorowania stanu sprzętu. (FA)

```sql
CREATE VIEW vw_distributor_pump_status AS
SELECT 
    d.distributor_no,
    d.status AS distributor_status,
    p.pump_id,
    p.status AS pump_status,
    pet.name AS petrol_name
FROM distributor d
JOIN pump p ON d.distributor_no = p.distributor_no
JOIN petrol pet ON p.petrol_id = pet.petrol_id;
```

**4. Szczegóły wszystkich faktur**

Widok "vw_invoice_details" służy do prezentacji szczegółów każdej faktury.
Uwzględnia takie informacje jak numer faktury, numer transakcji, NIP, numer rejestracyjny pojazdu, data transakcji, nazwa paliwa,
końcowy koszt transakcji po uwzględnieniu zniżki oraz identyfikator pracownika obsługującego transakcję. (FA)

```sql
CREATE VIEW vw_invoice_details AS
SELECT 
    i.invoice_id,
    i.transaction_id,
    i.NIP,
    i.plate,
    t.date AS transaction_date,
    p.name AS petrol_name,
    ROUND(t.amount * p.price * 
          CASE 
              WHEN d.value IS NULL THEN 1 
              ELSE (1 - d.value) 
          END, 2) AS final_cost, t.employee_id
FROM invoice i
JOIN [transaction] t ON i.transaction_id = t.transaction_id
JOIN pump pmp ON t.pump_id = pmp.pump_id
JOIN petrol p ON pmp.petrol_id = p.petrol_id
LEFT JOIN discount d ON t.discount_id = d.discount_id;
```
**5. Całkowita sprzedaż danego paliwa przez lata**

Widok vw_total_year_amount został stworzony w celu uzyskania rocznego podsumowania sprzedaży paliwa.
Widok zawiera dane dotyczące sumy sprzedanego paliwa oraz łącznej wartości sprzedaży dla każdego rodzaju paliwa,
z uwzględnieniem ewentualnych zniżek, w podziale na lata. (FP)

```sql
create view vw_total_year_amount as
select YEAR(date) AS year, SUM(t.amount) as total_amount,name,ROUND(SUM((t.amount*p.price*ISNULL(d.value,1))),2) as total_price from [transaction] as t
left join discount d on d.discount_id = t.discount_id
join pump on pump.pump_id = t.pump_id
join petrol as p on p.petrol_id = pump.petrol_id
group by name, YEAR(date)

```

**6. Aktywne zniżki**

Widok "vw_active_discounts" został stworzony w celu uzyskania listy aktywnych zniżek, które są aktualnie ważne, tzn. takich,
których data zakończenia jest pusta (nieokreślona) lub przypada na późniejszy termin niż bieżąca data. (FP)

```sql
CREATE VIEW vw_active_discounts AS
SELECT discount_id, discount_name, value, start_date, end_date
FROM discount
WHERE end_date IS NULL OR end_date > GETDATE();
```

**7. Suma obsłużonych transakcji przez pracownika**

Widok "vw_employee_transaction_count" oblicza liczbę transakcji obsłużonych przez każdego pracownika.

```sql
CREATE VIEW vw_employee_transaction_count AS
SELECT employee_id, COUNT(transaction_id) AS transaction_count
FROM [transaction]
GROUP BY employee_id;
```

**8. Średnia cena paliwa w miesiącu**

Widok "vw_avg_monthly_petrol_price" powstał do obliczania średniej ceny paliwa dla każdego miesiąca w danym roku,
z podziałem na poszczególne rodzaje paliwa.

```sql
create view vw_avg_monthly_petrol_price as
select year(date) as year, month(date) as month, p.petrol_id, name, avg(ph.price) as average
from dbo.petrol_history as ph
join dbo.petrol p on ph.petrol_id = p.petrol_id
group by year(date), month(date), name, p.petrol_id
```

**9. Całkowita ilość danego paliwa jaka została zatankowana z danego dystrybutora.**

Widok "vw_distributor_fuel_usage" jest zaprojektowany do monitorowania zużycia paliwa przez dystrybutory na stacji paliw.
Jego głównym celem jest dostarczenie informacji o całkowitej ilości paliwa sprzedanej przez każdy dystrybutor dla każdego rodzaju paliwa. (FP)

```sql
create view vw_distributor_fuel_usage as
select d.distributor_no, p.petrol_id, pet.name, SUM(t.amount) as total_amount
from dbo.pump p
join dbo.[transaction] t ON p.pump_id = t.pump_id
join dbo.distributor d ON p.distributor_no = d.distributor_no
join dbo.petrol pet on pet.petrol_id = p.petrol_id
group by p.petrol_id, d.distributor_no, pet.name
```



## Procedury/funkcje

(dla każdej procedury/funkcji należy wkleić kod polecenia definiującego procedurę wraz z komentarzem)

**1. Procedura dodawania nowej dostawy paliwa**

Procedura sp_add_new_supply została stworzona w celu dodania nowej dostawy paliwa do bazy danych. 
Procedura wprowadza nowe dane dostawy do tabeli supply, a następnie aktualizuje stan magazynowy odpowiedniego paliwa w tabeli petrol, 
zwiększając jego ilość o dostarczoną ilość paliwa. 
W przypadku wystąpienia błędu transakcja jest wycofywana, aby zachować spójność danych. (FP)

```sql
CREATE PROCEDURE sp_add_new_supply
    @supplier_id INT,
    @amount FLOAT,
    @date DATETIME,
    @petrol_id INT,
    @price MONEY
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Dodanie nowej dostawy
        INSERT INTO supply (supplier_id, amount, date, petrol_id, price)
        VALUES (@supplier_id, @amount, @date, @petrol_id, @price);

        -- Aktualizacja stanu magazynowego paliwa
        UPDATE petrol
        SET in_stock = in_stock + @amount
        WHERE petrol_id = @petrol_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        -- Zgłoszenie błędu
        THROW;
    END CATCH;
END;
```

**2. Procedura do monitorowania cen paliwa na przestrzeni czasu**

Procedura sp_debug_price_change została stworzona w celu monitorowania i debugowania zmian cen paliwa w określonym okresie.
Działa na podstawie nazwy paliwa i zakresu dat, sprawdzając ceny na początku i na końcu okresu,
a następnie obliczając procentową zmianę ceny. 

```sql
CREATE   PROCEDURE sp_debug_price_change (
    @start_date DATETIME,
    @end_date DATETIME,
    @petrol_name VARCHAR(50)
)
AS
BEGIN
    DECLARE @start_price FLOAT = NULL;
    DECLARE @end_price FLOAT = NULL;
    DECLARE @percentage_change FLOAT;

    -- Cena paliwa na początku okresu
    SELECT TOP 1 @start_price = ph.price
    FROM petrol_history ph
    JOIN petrol p ON ph.petrol_id = p.petrol_id
    WHERE p.name = @petrol_name AND ph.date <= @start_date
    ORDER BY ph.date DESC;

    -- Debugowanie: wyświetlanie ceny na początku okresu
    PRINT 'Cena na początku okresu: ' + CAST(@start_price AS VARCHAR);

    -- Cena paliwa na końcu okresu
    SELECT TOP 1 @end_price = ph.price
    FROM petrol_history ph
    JOIN petrol p ON ph.petrol_id = p.petrol_id
    WHERE p.name = @petrol_name AND ph.date <= @end_date
    ORDER BY ph.date DESC;

    -- Debugowanie: wyświetlanie ceny na końcu okresu
    PRINT 'Cena na końcu okresu: ' + CAST(@end_price AS VARCHAR);

    -- Procentowa zmiana ceny
    IF @start_price IS NULL OR @end_price IS NULL
    BEGIN
        PRINT 'Jedna z cen jest NULL. Zwracam NULL.';
        RETURN; -- Zwróć NULL, jeśli nie ma takich dat
    END

    SET @percentage_change = ((@end_price - @start_price) / @start_price) * 100;

    -- Debugowanie: wyświetlanie procentowej zmiany ceny
    PRINT 'Procentowa zmiana ceny: ' + CAST(@percentage_change AS VARCHAR);
END;
```

**3. Procedura rozpoczęcia procesu tankowania**

Procedura sp_start_fueling umożliwia rozpoczęcie tankowania, 
sprawdzając stan dystrybutora i pistoletu przed zmianą statusu pistoletu na "up". (FP)

```sql
CREATE PROCEDURE sp_start_fueling
    @pump_id INT
AS
BEGIN

	    -- Sprawdź status dystrybutora dla danego pistoletu
    DECLARE @distributor_status VARCHAR(50);
    SELECT @distributor_status = d.status
    FROM pump p
    JOIN distributor d ON p.distributor_no = d.distributor_no
    WHERE p.pump_id = @pump_id;

    -- Jeżeli status dystrybutora jest 'down', nie można rozpocząć tankowania
    IF @distributor_status = 'down'
    BEGIN
        PRINT 'Dystrybutor nieczynny. Nie można rozpocząć tankowania';
        RETURN;
    END

    -- Sprawdzenie, czy pistolet jest w stanie "down" / "up"
	    IF EXISTS (
        SELECT 1
        FROM dbo.pump
        WHERE pump_id = @pump_id
        AND status = 'up'
    )
	BEGIN
		PRINT 'Ktoś już tankuje. Proszę wybrać inny dystrybutor.';
	END

    IF EXISTS (
        SELECT 1
        FROM dbo.pump
        WHERE pump_id = @pump_id
        AND status = 'down'
    )
    BEGIN
        -- Zmiana stanu pistoletu na "up"
        UPDATE dbo.pump
        SET status = 'up'
        WHERE pump_id = @pump_id;

        PRINT 'Rozpoczęto tankowanie. Status pistoletu zmieniony na "up".';
    END
END;
```

**4. Procedura zakończenia procesu tankowania**

Procedura sp_finish_refueling jest używana do zakończenia procesu tankowania. 
Obejmuje kilka kroków: sprawdzenie, czy jest wystarczająca ilość paliwa w zapasie, 
dodanie nowej transakcji, aktualizację zapasu paliwa oraz zmianę statusu pistoletu na "up".

```sql
CREATE   PROCEDURE sp_finish_refueling
    @pump_id INT,
    @employee_id INT,
    @amount FLOAT,
    @discount_id INT = NULL
AS
BEGIN
    DECLARE @petrol_id INT;
    DECLARE @current_stock FLOAT;

    BEGIN TRANSACTION;

    -- Odczytaj jakie paliwo jest na danym pistolecie
    SELECT @petrol_id = petrol_id
    FROM pump
    WHERE pump_id = @pump_id;

    -- Odczytaj aktualny zapas paliwa
    SELECT @current_stock = in_stock
    FROM petrol
    WHERE petrol_id = @petrol_id;

    -- Sprawdź czy jest wystarczająco paliwa w zapasie
    IF @current_stock >= @amount
    BEGIN
        -- Dodaj nową transackcję
        INSERT INTO dbo.[transaction] (pump_id, amount, employee_id, date, discount_id)
        VALUES (@pump_id, @amount, @employee_id, GETDATE(), @discount_id);

        -- Zaktualizuj zapas paliwa
        UPDATE petrol
        SET in_stock = in_stock - @amount
        WHERE petrol_id = @petrol_id;

        -- Zaktualizuj status pistoletu
        UPDATE pump
        SET status = 'up'
        WHERE pump_id = @pump_id;

        COMMIT TRANSACTION;
    END
    ELSE
    BEGIN
        -- Jeśli brakuje paliwa
        ROLLBACK TRANSACTION;
        RAISERROR('Not enough fuel in stock.', 16, 1);
    END
END;
```

**5. Procedura aktualizacji statusu dystrybutora**

Procedura "sp_update_distributor_status" służy do aktualizowania statusu dystrybutora w bazie danych, 
a także aktualizowania statusu powiązanych pomp w zależności od nowego statusu dystrybutora. (FP)

```sql
CREATE PROCEDURE sp_update_distributor_status
    @distributor_no INT,
    @new_status VARCHAR(50)
AS
BEGIN
    -- Zmieniamy status dystrybutora
    UPDATE dbo.distributor
    SET status = @new_status
    WHERE distributor_no = @distributor_no;

    -- Jeżeli nowy status dystrybutora to 'down', zmieniamy statusy powiązanych pomp
    IF @new_status = 'down'
    BEGIN
        UPDATE dbo.pump
        SET status = 'down'
        WHERE distributor_no = @distributor_no;
    END

	IF @new_status = 'up'
    BEGIN
        UPDATE dbo.pump
        SET status = 'up'
        WHERE distributor_no = @distributor_no;
    END
END;
```
**6. Procedura aktualizacji cen paliwa**

Procedura "sp_update_fuel_price" aktualizowania ceny paliwa w bazie danych 
dla określonego typu paliwa oraz rejestrowania historii zmian cen.

```sql
CREATE PROCEDURE sp_update_fuel_price
@petrol_id INT,
@new_price MONEY
AS
BEGIN
    UPDATE petrol
    SET price = @new_price
    WHERE petrol_id = @petrol_id;

    INSERT INTO petrol_history (petrol_id, price, date)
    VALUES (@petrol_id, @new_price, GETDATE());
END;
```

**7. Procedura dodanie zniżki z walidacją**

Ta procedura dodaje nową zniżkę do tabeli discount po sprawdzeniu poprawności danych wejściowych. Procedura waliduje, czy wartość zniżki jest między 0 a 1 oraz czy data rozpoczęcia zniżki jest wcześniejsza niż data zakończenia.
Jeśli walidacja przejdzie pomyślnie, nowa zniżka zostaje dodana do tabeli. (FA)

```sql
CREATE PROCEDURE sp_add_new_discount_with_validation (
@discount_name VARCHAR(50),
@value FLOAT,
@start_date DATETIME,
@end_date DATETIME
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        IF @value <= 0 OR @value > 1
        BEGIN
            THROW 50001, 'Discount value must be between 0 and 1', 1;
        END

        IF @start_date >= @end_date
        BEGIN
            THROW 50002, 'Start date must be earlier than end date', 1;
        END

        INSERT INTO discount (discount_name, value, start_date, end_date)
        VALUES (@discount_name, @value, @start_date, @end_date);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
```

**8. Procedura generująca raport sprzedaży dla danego okresu**

Ta procedura generuje raport sprzedaży dla danego okresu, grupując dane według pracowników i rodzajów paliwa. Wykorzystuje tabele transaction, pump, petrol i employee, aby uzyskać informacje o sprzedaży.
Raport zawiera imię i nazwisko pracownika, nazwę paliwa, całkowitą ilość sprzedanego paliwa oraz całkowitą wartość sprzedaży. (FA)

```sql
CREATE PROCEDURE sp_generate_sales_report (
@start_date DATETIME,
@end_date DATETIME
)
AS
BEGIN
    BEGIN TRY
        SELECT 
            e.firstname + ' ' + e.lastname AS employee_name,
            p.name AS petrol_name,
            SUM(t.amount) AS total_amount,
            SUM(t.amount * p.price) AS total_sales
        FROM [transaction] t
        JOIN pump pu ON t.pump_id = pu.pump_id
        JOIN petrol p ON pu.petrol_id = p.petrol_id
        JOIN employee e ON t.employee_id = e.employee_id
        WHERE t.date BETWEEN @start_date AND @end_date
        GROUP BY e.firstname, e.lastname, p.name
        ORDER BY total_sales DESC;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
```

**9. Funkcja sprawdzania sprzedaży paliwa w danym okresie**

Funkcja "fn_fuel_sales_by_date" służy do uzyskania zestawienia sprzedaży paliwa w określonym przedziale czasowym.

```sql
CREATE FUNCTION fn_fuel_sales_by_date
(
    @start_date DATETIME,
    @end_date DATETIME
)
RETURNS TABLE
AS
RETURN
(
    SELECT t.transaction_id, t.date, t.amount, p.name AS petrol_name, (t.amount * p.price) AS total_price
    FROM [transaction] t
    JOIN pump pu ON t.pump_id = pu.pump_id
    JOIN petrol p ON pu.petrol_id = p.petrol_id
    WHERE t.date BETWEEN @start_date AND @end_date
);
GO
```

**10. Funkcja sprawdzania statusu dystrybutora**

Funkcja "fn_check_dist_status" służy do sprawdzania statusu dystrybutora, do którego jest przypisana konkretna pompa. (FP)

```sql
CREATE FUNCTION fn_check_dist_status (@pump_id INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @distributor_status VARCHAR(50);

    SELECT @distributor_status = d.status
    FROM pump p
    JOIN distributor d ON p.distributor_no = d.distributor_no
    WHERE p.pump_id = @pump_id;

    RETURN @distributor_status;
END;
GO
```

**11. Funkcja do sprawdzania zmiany cen paliwa**

Funkcja "fn_price_change" oblicza procentową zmianę ceny danego typu paliwa w określonym przedziale czasowym.

```sql
CREATE FUNCTION fn_price_change (
    @start_date DATETIME,
    @end_date DATETIME,
    @petrol_name VARCHAR(50)
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @start_price FLOAT;
    DECLARE @end_price FLOAT;
    DECLARE @percentage_change FLOAT;

    -- Cena paliwa na początku okresu
    SELECT TOP 1 @start_price = ph.price
    FROM petrol_history ph
    JOIN petrol p ON ph.petrol_id = p.petrol_id
    WHERE p.name = @petrol_name AND ph.date = @start_date
    ORDER BY ph.date DESC;

    -- Cena paliwa na końcu okresu
    SELECT TOP 1 @end_price = ph.price
    FROM petrol_history ph
    JOIN petrol p ON ph.petrol_id = p.petrol_id
    WHERE p.name = @petrol_name AND ph.date = @end_date
    ORDER BY ph.date DESC;

    -- Procentowa zmiana ceny
    IF @start_price IS NULL OR @end_price IS NULL
    BEGIN
        RETURN NULL; -- Zwróć NULL, jeśli nie ma takich dat
    END

    SET @percentage_change = ((@end_price - @start_price) / @start_price) * 100;

    RETURN ROUND(@percentage_change, 1);
END;
GO
```

**12. Funkcja do sprawdzania całkowitej wartości dostarczonego paliwa przez dostawcę**

Funkcja "fn_total_supply_cost_per_supplier" oblicza łączną wartość dostaw dla określonego dostawcy. (FP)

```sql
CREATE FUNCTION fn_total_supply_cost_per_supplier (@supplier_id INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @total_cost MONEY;

    SELECT @total_cost = SUM(amount * price)
    FROM supply
    WHERE supplier_id = @supplier_id;

    RETURN @total_cost;
END;
```
**13. Funkcja całkowita sprzedaż paliwa przez dystrybutor**

Ta funkcja oblicza całkowitą wartość sprzedaży paliwa przez konkretnego dystrybutora. Łączy dane z tabel transaction, pump i petrol, aby uzyskać ilość sprzedanego paliwa oraz cenę sprzedaży każdego typu paliwa.
Suma wartości sprzedaży jest następnie zwracana jako wynik. (FA)

```sql
CREATE FUNCTION fn_total_fuel_sales_by_distributor (
    @distributor_no INT
) RETURNS FLOAT
AS
BEGIN
    DECLARE @total_sales FLOAT;

    SELECT @total_sales = SUM(t.amount * p.price)
    FROM [transaction] t
    JOIN pump pu ON t.pump_id = pu.pump_id
    JOIN petrol p ON pu.petrol_id = p.petrol_id
    WHERE pu.distributor_no = @distributor_no;

    RETURN @total_sales;
END;
```
**14. Funkcja do sprawdzania dostępności pracownika**

Ta funkcja sprawdza, czy pracownik jest dostępny w określonym zakresie dat. Wykorzystuje tabelę schedule do sprawdzenia, czy pracownik nie jest zaplanowany na dyżur w podanym okresie.
Jeśli pracownik jest zaplanowany na jakikolwiek dyżur w tym zakresie dat, funkcja zwraca wartość 0 (niedostępny). W przeciwnym razie zwraca wartość 1 (dostępny). (FA)

```sql
CREATE FUNCTION fn_check_employee_availability (
@employee_id INT,
@start_date DATETIME,
@end_date DATETIME
) RETURNS BIT
AS
BEGIN
    DECLARE @availability BIT;

    IF EXISTS (
        SELECT 1
        FROM schedule
        WHERE employee_id = @employee_id
          AND (@start_date BETWEEN start_date AND end_date
               OR @end_date BETWEEN start_date AND end_date)
    )
    BEGIN
        SET @availability = 0;
    END
    ELSE
    BEGIN
        SET @availability = 1;
    END

    RETURN @availability;
END;
```
## Triggery

(dla każdego triggera należy wkleić kod polecenia definiującego trigger wraz z komentarzem)



[wzor_dok.md](https://github.com/FilipAdamus03/Petrol-Station-Database/files/14943695/wzor_dok.md)
