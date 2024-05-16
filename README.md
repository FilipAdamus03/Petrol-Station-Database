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

Rafał Dubiel, 
Daniel Antolak, 
Filip Adamus, 
Filip Przepiórka.

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

![image](https://github.com/fprzepio/Petrol-station-Database/assets/132128402/b62b7ae4-e9b1-4d69-b4b1-a8f6b5dde4fd)


## Opis poszczególnych tabel

<br>

Nazwa tabeli: petrol_history
- Opis: Tabela przechowująca historię cen paliwa.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| petrol_history_id | int | PK, Numer ID historii paliwa |
| petrol_id | int |FK, Numer ID paliwa |
| price | money | Historyczna cena paliwa |
| date | datetime | Data |

<br>

Nazwa tabeli: petrol
- Opis: Tabela zawierająca informacje o paliwach.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| petrol_id | int | PK, Numer ID paliwa |
| supplier_id | int | FK, Numer ID dostawcy paliwa |
| name | varchar(50) | Nazwa paliwa |
| in_stock | float | Aktualny stan paliwa |
| price | money | Aktualna cena paliwa |

<br>

Nazwa tabeli: supplier
- Opis: Tabela zawierająca dokładne dane dostawców paliwa.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| supplier_id | int | PK, Numer ID dostawcy
| company_name | varchar(50) | Nazwa dostawcy |
| postal_code | varchar(10) | Kod pocztowy |
| address | varchar(50) | Adres siedziby firmy |
| city | varchar(30) | Miasto dostawcy |
| country | varchar(30) | Państwo dostawcy |
| phone | varchar(20) | Numer telefonu dostawcy |

<br>

Nazwa tabeli: pump
- Opis: Tabela reprezentująca konkretne pistolety paliwa oraz ich dystrybutory.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| pump_id | int | PK, Numer ID pistoletu |
| petrol_id | int | FK, Numer ID paliwa |
| distributor_no | int | Numer dystrybutora |

<br>

Nazwa tabeli: transaction
- Opis:  Tabela zawierające informacje o transakcjach kupna.

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| transaction_id | int | PK, Numer ID transakcji |
| pump_id | int | FK, Numer ID pistoletu |
| amount | float | Ilość zakupionego paliwa |
| discount | float | Rabat na paliwo (zezwala na wartość NULL) |
| invoice_id | int | FK, Numer ID faktury (zezwala na wartość NULL) |
| employee_id | int | FK, Numer ID pracownika |
| date | datetime | Data transakcji |

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
| NIP | varchar(10) | Numer NIP firmy |
| plate | varchar(20) | Numer rejestracyjny (zezwala na wartość NULL) |

<br>

# 4.	Implementacja

## Kod poleceń DDL

(dla każdej tabeli należy wkleić kod DDL polecenia tworzącego tabelę)

<br>
Tabela: employee 
<br>

```sql
CREATE TABLE [dbo].[employee](
	[employee_id] [int] NOT NULL,
	[firstname] [varchar](30) NOT NULL,
	[lastname] [varchar](30) NOT NULL,
	[title] [varchar](20) NOT NULL,
	[address] [varchar](20) NOT NULL,
	[city] [varchar](20) NOT NULL,
	[postal_code] [varchar](10) NOT NULL,
	[country] [varchar](20) NOT NULL,
	[phone] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
```
<br>
Tabela: invoice
<br>

```sql
CREATE TABLE [dbo].[invoice](
	[invoice_id] [int] NOT NULL,
	[NIP] [varchar](10) NOT NULL,
	[plate] [varchar](20) NULL,
 CONSTRAINT [PK_car] PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
```
<br>
Tabela: petrol
<br>

```sql
CREATE TABLE [dbo].[petrol](
	[petrol_id] [int] NOT NULL,
	[supplier_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[in_stock] [float] NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_petrol_1] PRIMARY KEY CLUSTERED 
(
	[petrol_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
```
<br>
Tabela: petrol_history
<br>

```sql
CREATE TABLE [dbo].[petrol_history](
	[petrol_history_id] [int] NOT NULL,
	[petrol_id] [int] NOT NULL,
	[price] [money] NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_petrol_history_1] PRIMARY KEY CLUSTERED 
(
	[petrol_history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
```
<br>
Tabela: pump
<br>

```sql
CREATE TABLE [dbo].[pump](
	[pump_id] [int] NOT NULL,
	[petrol_id] [int] NOT NULL,
	[distributor_no] [int] NOT NULL,
 CONSTRAINT [PK_pump] PRIMARY KEY CLUSTERED 
(
	[pump_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
```
<br>
Tabela: supplier
<br>

```sql
CREATE TABLE [dbo].[supplier](
	[supplier_id] [int] NOT NULL,
	[company_name] [varchar](50) NOT NULL,
	[postal_code] [varchar](10) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[city] [varchar](30) NOT NULL,
	[country] [varchar](30) NOT NULL,
	[phone] [varchar](20) NOT NULL,
 CONSTRAINT [PK_supplier] PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
```
<br>
Tabela: transaction
<br>

```sql
CREATE TABLE [dbo].[transaction](
	[transaction_id] [int] NOT NULL,
	[pump_id] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[discount] [float] NULL,
	[invoice_id] [int] NULL,
	[employee_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_transaction] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
```

## Widoki

(dla każdego widoku należy wkleić kod polecenia definiującego widok wraz z komentarzem)

## Procedury/funkcje

(dla każdej procedury/funkcji należy wkleić kod polecenia definiującego procedurę wraz z komentarzem)

## Triggery

(dla każdego triggera należy wkleić kod polecenia definiującego trigger wraz z komentarzem)



[wzor_dok.md](https://github.com/FilipAdamus03/Petrol-Station-Database/files/14943695/wzor_dok.md)
