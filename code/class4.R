# Załadujemy tylko tidyverse, który zawiera dplyr i ggplot2
# Jeśli pakiet nie jest zainstalowany, odkomentuj linię poniżej:
# install.packages("tidyverse")

library(tidyverse)


# Zadanie 1
# Stwórz dwie zmienne: `waga` (przypisz wartość 75) i `wzrost` (przypisz wartość 1.80).
# Oblicz BMI korzystając ze wzoru: BMI = waga / (wzrost^2).
# Wynik wypisz na ekranie.

# Tu wpisz swój kod:

waga <- 75
wzrost <- 1.80

BMI <- waga / (wzrost^2)
BMI

# Zadanie 2
# Stwórz wektor `liczby` zawierający liczby od 10 do 20.
# Następnie, używając indeksowania, wyświetl tylko trzeci i piąty element tego wektora.
# Tu wpisz swój kod:

liczby <- 10:20

liczby[c(3, 5)]



# Zadanie 3
# Masz dany wektor:
temperature <- c(22, 15, 30, 18, 25, 10)

# Napisz kod, który zwróci (przefiltruje) tylko te temperatury,
# które są wyższe lub równe 20 stopni.

# Tu wpisz swój kod:
temperature[temperature >= 20]



# Zadanie 4 
# Zbiór danych airquality (wbudowany w R) zawiera braki danych (NA). 
# Oblicz średnią dla kolumny Ozone, pamiętając o usunięciu braków danych (argument na.rm). 
# Wskazówka: odwołaj się do kolumny używając dolara: airquality$Ozone

airquality
srednia_ozone <- mean(Ozone$airquality)

