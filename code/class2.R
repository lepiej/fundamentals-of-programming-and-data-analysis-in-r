oblicz_cena_brutto <- function(cena_netto) {
  cena_brutto <- cena_netto * 1.23
  return(cena_brutto)
}

#cena_brutto i cena_netto są tylko lokalnie więc nie są zapisane w env 

#wywołanie funkcji:
cena_brutto_od_100 <- oblicz_cena_brutto(100)
oblicz_cena_brutto(250)

#zad.2
czy_zdał <- function(punkty) {
  punkty <- c(45,55,60,51)
  srednia <- mean(punkty)
  if(srednia >= 50) {
    return(TRUE)
    } else {
      return(FALSE)
    }
}

punkty_studenta <- c(45,55,60,51)
czy_zdał(punkty_studenta)

#zad.3 
powitanie_uzytkownika <- function(imię, miasto) {
  text <- paste("Witaj", imię, "z miasta", miasto, "!")
  return(text)
}
powitanie_uzytkownika("Beata", "Warszawa")

#zad.4
install.packages("dplyr")
library(dplyr)
install.packages("tidyverse")

spolki <- data.frame(
  nazwa = c("Alpha", "Beta", "Gamma", "Delta", "Epsilon"),
  sektor = c("Technologia", "Finanse", "Technologia", "Zdrowie", "Finanse"),
  przychody_mln = c(250,180,320,150,210),
  koszty_mln = c(150,90,200,100,130),
  rok_zalozenia = c(2005, 1998,2010,2002,2008)
)
print(spolki)

filter(spolki, sektor == "Technologia")
filter(spolki, przychody_mln > 200)

select(spolki, nazwa, przychody_mln)
select(spolki, sektor, rok_zalozenia)
arrange(spolki, desc(przychody_mln))
mutate(spolki, zysk_mln = przychody_mln - koszty_mln)
spolki

arrange(mutate(filter(spolki, sektor == "Technologia"), zysk_mln = przychody_mln - koszty_mln), desc(zysk_mln))

#TAK MAMY PISAC KOD
spolki %>%
  filter(sektor == "Finanse") %>%
  mutate(zysk_mln = przychody_mln - koszty_mln) %>%
  arrange(desc(zysk_mln))

spolki %>%
  filter(sektor == "Technologia") %>%
summarise(suma_przychodow = sum(przychody_mln))

spolki %>%
  group_by(sektor) %>%
  summarise(sredni_przychod = mean(przychody_mln))

#zad.4
spolki %>%
  filter(rok_zalozenia > 2005) %>%
mutate(marza_zysku = (przychody_mln - koszty_mln)/ przychody_mln) %>%
select(nazwa, marza_zysku) %>%
  arrange(desc(nazwa)) %>%
arrange(desc(marza_zysku))

#zad.5
getwd()
dane_do_zapisu<- data.frame(
  ID_Produktu = 1:1,
  Nazwa_Produktu = c("Laptop"), #, "Mysz", "Klawiatura", "Monitor", "Dysk SSD"),
  Cena = c(4500), #, 150, 250, 1200, 400),
  Stan_Magazynowy = c(30), 150,80,45,110)

write.csv(dane_do_zapisu, "produkty.csv", rows.names = "FALSE")

#zad.5
library(readr)
sp500_ceny_zamkniecia_od_poczatku_roku <- read_csv("sp500_ceny_zamkniecia_od_poczatku_roku.csv")
sp500_ceny_zamkniecia_od_poczatku_roku$Data
sp500_ceny_zamkniecia_od_poczatku_roku$Cena_Zamkniecia


}
