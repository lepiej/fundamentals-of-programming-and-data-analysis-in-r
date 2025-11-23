#Zadanie na rozgrzewkę: Analiza mtcars
#Wykorzystamy wbudowany w R zbiór danych mtcars. Jest to klasyczny zbiór zawierający dane o różnych modelach samochodów z lat 70.

#Treść zadania:
# -  Używając pakietu dplyr i operatora potoku %>%:
# -  Załaduj zbiór danych mtcars (funkcja data(mtcars)).
# -  Odfiltruj samochody tak, aby w analizie pozostały tylko te, które mają 6 lub 8 cylindrów (kolumna cyl).
# -  Pogrupuj przefiltrowane dane ze względu na liczbę cylindrów (cyl).
# -  Oblicz (agreguj) dla każdej grupy:
# -  Średnie zużycie paliwa (średnia z kolumny mpg - miles per gallon).
# -  Maksymalną moc koni mechanicznych (maksimum z kolumny hp).
# -  Liczbę samochodów w danej grupie (funkcja n()).
# -  Posortuj końcową ramkę danych malejąco według obliczonego średniego zużycia paliwa.
# -  Wyświetl wynik.
data(mtcars)

mtcars %>% 
  filter(cyl == 6 | cyl == 8) %>% 
  group_by(cyl) %>% 
  summarise(srednia = mean(mpg), max_moc_w_grupie = max(hp), liczba = n()) %>% 
  arrange(desc(srednia))


  title: "class 3"
author: "Beata Krzeminska"
date: "`r Sys.Date()`"
output: pdf_document

print("to jest kod R")

summary(cars)


knitr::opts_chunk$set(echo = TRUE, warning = FALSE, message = FALSE,width = 1600)


plot(pressure)

library(tidyverse)


# Informacje o pracownikach i projektach

# Zbiór 1: 
df_info <- tibble(
  id = c(101, 102, 103, 104),
  nazwisko = c("Kowalski", "Nowak", "Lis", "Dąb"),
  dzial = c("IT", "Finanse", "Finanse", "HR")
)

# Zbiór 2:
df_projekty <- tibble(
  id_pracownika = c(101, 102, 102, 105),
  projekt = c("Alfa", "Beta", "Gamma", "Delta")
)

print(df_info)
print(df_projekty)

# Left join - Bierze wszystko z lewej tabeli (df_info) i dołącza pasujące dane z prawej (df_projekty).

left_join(df_info, df_projekty, by = c("id" = "id_pracownika"))

inner_join(df_info, df_projekty, by = c("id" = "id_pracownika"))

# Zbiór danych `economics` jest dostępny po załadowaniu `ggplot2` (część `tidyverse`)
dane_eko <- ggplot2::economics

# Szybki podgląd struktury danych
glimpse(dane_eko)

# Zobaczmy pierwsze wiersze
head(dane_eko)

summary(dane_eko)


## ZADANIE: 
#Na podstawie dane_eko stwórzmy dane_eko_po_2000, gdzie:
# filtrujemy dane od "2000-01-01"
#dodajemy kolumnę poziom_oszczednosci gdzie dla psvert < 5 = Niski, <10 Sredni, >= 10 Wysoki


# Używamy potoku (pipe) %>%
dane_eko_po_2000 <- dane_eko %>%
  
  # Krok 1: Filtrujemy dane, aby pokazać tylko te od 1 stycznia 2000
  filter(date >= "2000-01-01") %>%
  
  # Krok 2: Tworzymy nową kolumnę
  # `psavert` to stopa oszczędności osobistych (w procentach)
  # Stwórzmy kolumnę kategoryzującą poziom oszczędności
  mutate(
    poziom_oszczednosci = case_when(
      psavert < 5  ~ "Niski",
      psavert < 10 ~ "Średni",
      psavert >= 10 ~ "Wysoki"
    )
  )

# Zobaczmy wynik
head(dane_eko_po_2000)
tail(dane_eko_po_2000)



filter(dane_eko_po_2000, psavert < 5)



dane_eko_po_2000 %>% #dane
  ggplot(aes(x = date, y = uempmed)) + # mapping
  #geom_line(color = "blue") + # Warstwa: wykres liniowy
  geom_path(linejoin = "round") +
  #    geom_ribbon(aes(ymin = unemploy - 900, 
  #                    ymax = unemploy + 900 
  #                    ))+
  labs(
    title = "Stopa oszczędności osobistych w USA",
    subtitle = "Dane od 2000 roku",
    x = "Data",
    y = "Stopa oszczędności (%)"
  ) +
  theme_minimal() # Ustawia ładny, czysty motyw

summary(mpg)
head(mpg)

#g <- ggplot(mpg, aes(class))
g <- mpg %>% #data
  filter(year == 1999) %>%
  ggplot(aes(class)) #mapping

# Number of cars in each class:
g + 
  geom_bar() + 
  labs(title ="Liczba kategorii w roku 1999")

#Wykres punktowy

dane_eko_po_2000 %>%
  ggplot(aes(x = uempmed, y = psavert)) + #mapping
  geom_point( # warstwa 1 -> punkty
    alpha = 0.5, # Przezroczystość
    aes(color = poziom_oszczednosci) # Mapowanie koloru na naszą nową kolumnę
  ) +
  geom_smooth(method = "lm", se = FALSE, color = "red") + # Dodanie linii trendu # warstwa 2 -> linia trendu
  labs(
    title = "Zależność między bezrobociem a oszczędnościami",
    x = "Mediana tygodni bezrobocia",
    y = "Stopa oszczędności (%)",
    color = "Poziom oszczędności"
  ) +
  theme_minimal()

dane_eko_po_2000 %>%
  ggplot(aes(x = psavert)) +
  geom_histogram(
    binwidth = 1, # Szerokość "słupka" = 1 punkt procentowy
    fill = "darkgreen",
    color = "black"
  ) +
  labs(
    title = "Rozkład stopy oszczędności (po 2000 r.)",
    x = "Stopa oszczędności (%)",
    y = "Liczba obserwacji (miesięcy)"
  ) +
  theme_minimal()

# Zobaczmy na dane diamonds
glimpse(diamonds)

# `geom_bar()` automatycznie zlicza wystąpienia każdej kategorii
diamonds %>%
  ggplot(aes(x = cut, fill = clarity)) + # Mapujemy "cut" na oś X, a "clarity" na kolor wypełnienia
  geom_bar(position = "dodge") + # position="fill" pokazuje proporcje (100%)
  labs(
    title = "Rozkład jakości szlifu (Cut) w podziale na czystość (Clarity)",
    x = "Jakość szlifu",
    y = "Liczebność (dodge), Proporcja (fill)",
    fill = "Czystość"
  ) +
  theme_minimal()

