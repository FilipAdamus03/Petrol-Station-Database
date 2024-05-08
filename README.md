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
Wszystkie rekordy będą odpowiednio zapisywane w utworzonych tabelach pod unikalnymi wierszami. 

Klient przyjeżdża na stacje paliw wybiera dystrybutor z którego chce tankować, pobiera odpowiedni pistolet i określony rodzaj paliwa. Zatankowana ilośc paliwa zostanie odpowiednio odznaczona w bazie. 
Jeśli klient zapłaci za zatankowane paliwo, zapisana zostanie kwota transakcji oraz jej data i
zostanie oznaczona jako opłacona transakcja. Jeśli nie będzie opłacona przed wyjazdem klienta, zostaje
oznaczone jako nieopłacona.

Cena paliwa, może zmienić się raz na dzień przy liczeniu kasy i jest to uwzględnione przy wyliczaniu
dochodów miesięcznych stacji paliw ze sprzedaży paliwa.

Celem projektu jest stworzenie i zaimplementowanie systemu, który umożliwi
sprawną obsługę procesów zakupu i sprzedaży paliwa oraz
generowanych przychodów. System ma być prosty w obsłudze i skalowalny.
Istotą projektu jest stworzenie nowoczesnej bazy, która pozwoli na lepsze
zarządzanie stacją paliw oraz usprawnienie procesów zakupu i sprzedaży paliwa.


System przechowywać będzie informacje na temat
dostawców paliwa, dystrybutorów, klientów, transakcji oraz pracowników stacji. Będzie możliwość
generowania raportów oraz zarządzania transakcjami. System będzie
dostępny dla pracowników stacji paliw oraz właścicieli.




# 2.	Wymagania i funkcje systemu

(np. lista wymagań, np. historyjki użytkownika, np. przypadki użycia itp.) 

### Funkcje systemu stacji benzynowej:

System powinien rejestrować wszystkie informacje dotyczące sprzedaży paliwa, klientów, pracowników, dostaw, rozliczeń. 

System powinien zawierać odpowiednie procedury i funkcje służące organizacji, zarządzaniu bazy danych. 

System powinien umożliwiać zapisanie danych firmy do faktury aby przyspieszyć proces przy następnej sprzedaży.

Jako klient, chcę mieć możliwość otrzymania faktury za kupione paliwo.

Jako sprzedawca chcę mieć możliwość uzyskania raportu sprzedaży z konkretnego dnia.

System powinien rejestrować dostawy paliwa wraz z konkretną datą, ceną, ilością i typem paliwa oraz dostawcom.

System powinien rejestrować jaki typ paliwa jest tankowany.

System powinien przechowywać wszystkie informacje z konkretnych sprzedaży.

Możliwość monitorowania zapasów paliwa.

Zarządzanie transakcjami zakupu i sprzedaży paliwa.
   
Przechowywanie informacji o dostawcach paliwa.

Przechowywanie informacji o klientach.

Przechowywanie informacji o pracownikach stacji.



# 3.	Projekt bazy danych

## Schemat bazy danych

(diagram (rysunek) przedstawiający schemat bazy danych) 

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
