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

Klient przyjeżdża na stacje paliw, wybiera odpowiedni dystrybutor i rodzaj paliwa, które chce zatankować.
Po opłaceniu rachunku przez klienta, zapisana zostanie kwota transakcji, przyznana zniżka, data, numer dystrybutora z którego pobrano paliwo, 
pracownika który obsłużył zamówienie oraz numer samochodu .
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

## Schemat bazy danych

(diagram (rysunek) przedstawiający schemat bazy danych) 

![image](https://github.com/fprzepio/Petrol-station-Database/assets/132128402/76510a6d-180f-46ee-9d89-70d808c5dc15)



## Opis poszczególnych tabel

(Dla każdej tabeli opis w formie tabelki)


Nazwa tabeli: (nazwa tabeli)
- Opis: (opis tabeli, komentarz)

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| Atrybut 1 …    |      |            |
| Atrybut 2 …    |      |            |


# 4.	Implementacja

## Kod poleceń DDL

(dla każdej tabeli należy wkleić kod DDL polecenia tworzącego tabelę)

```sql
create table tab1 (
   a int,
   b varchar(10)
)
```

## Widoki

(dla każdego widoku należy wkleić kod polecenia definiującego widok wraz z komentarzem)

## Procedury/funkcje

(dla każdej procedury/funkcji należy wkleić kod polecenia definiującego procedurę wraz z komentarzem)

## Triggery

(dla każdego triggera należy wkleić kod polecenia definiującego trigger wraz z komentarzem)



[wzor_dok.md](https://github.com/FilipAdamus03/Petrol-Station-Database/files/14943695/wzor_dok.md)
