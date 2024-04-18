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

Projekt ma na celu stworzenie systemu do obsługi stacji benzynowej. W projektowanej bazie danych będą rejestrowane wszelkie informacje, wymagane do poprawnego funkcjonowania stacji. Wszystkie rekordy będą odpowiednio zapisywane w utworzonych tabelach pod unikalnymi wierszami. 


# 2.	Wymagania i funkcje systemu

(np. lista wymagań, np. historyjki użytkownika, np. przypadki użycia itp.) 

### Wymagania techniczne:
Koncesja: Aby otworzyć stację paliw, konieczne jest uzyskanie koncesji. Wniosek o koncesję powinien zawierać informacje o wnioskodawcy, zakresie działalności, środkach finansowych, możliwościach technicznych i zatrudnieniu osób o właściwych kwalifikacjach1.
Usytuowanie i zabudowa: Stacje paliw płynnych w obszarze zabudowanym muszą być oddzielone od krawędzi jezdni wysepką lub zatoką. Pawilon stacji powinien być wykonany z elementów nierozprzestrzeniających ognia1.

### Funkcje systemu stacji benzynowej:
Obsługa klientów: System powinien umożliwiać obsługę klientów, w tym tankowanie paliwa, płatności, wydawanie paragonów itp.
Zarządzanie zapasami: System powinien śledzić stan zapasów paliwa, olejów, akcesoriów itp.
Bezpieczeństwo: System powinien monitorować stację, alarmować w przypadku awarii lub nieprawidłowości oraz zapewniać bezpieczeństwo pracowników i klientów.
Raportowanie: System powinien generować raporty na temat sprzedaży, stanu zapasów, obrotu itp.


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
