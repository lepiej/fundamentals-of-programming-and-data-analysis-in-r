# =====================================
# 1. WPROWADZENIE DO R
# =====================================

# Operacje arytmetyczne
2 + 2 #intiger 
10 - 3 #
4 * 5
20 / 4
5^3

?sqrt()
abs(-2)
sqrt(16)

?print()
print(5^2)

# Użycie funkcji pomocniczej
?print
print("Witaj w R!")

# Przypisywanie wartości do zmiennej
a <- 7

print(a)

b <- 3
b = 4

b == 3

c <- a * b
print(c)

# Typy danych
?typeof

typeof(a)

is.numeric(a)
is.character("tekst")

# Logika i operatory porównania
a > b
a == b
a != b

TRUE & FALSE
TRUE | FALSE

!TRUE


# =====================================
# 2. OBIEKTY W R: WEKTORY, MACIERZE, LISTY, RAMKI DANYCH
# =====================================

# Wektory

# Przechowują tylko elementy tego samego typu
wektor <- c(10, 20, 30, 80, 50)

zmienna_z_wektorem = c(2,10,20)

?c()

wektor[1]
wektor[2:4]
#bez drugiego elementu
wektor[-2]

wektor[2:length(wektor)]

length(wektor)

#c() - to funkcja 

# Operacje na wektorach
wektor + 5

log(wektor)

wektor > 25

c(1, 2, 3, 4, 1) -> wektor_2; wektor_2

2 -> wektor_2[1]
wektor_2

wektor * wektor_2

c(pon = 24, wto = 35, sro = 28, czw = 32, pia = 47, sb = 44) -> stawka_godzinowa; 
stawka_godzinowa

stawka_godzinowa[1]
stawka_godzinowa['pon']
stawka_godzinowa['pia']


names(stawka_godzinowa) <- c(1,2,3,4,5,6)

stawka_godzinowa

# PORZ?DKOWANIE WEKTORA
wektor
sorted_wektor <- sort(wektor)
sorted_wektor
rank(wektor)
order(wektor) 

rev(wektor)
rev(sorted_wektor)

?rev

#statystyki wektora

sum(stawka_godzinowa)

min(stawka_godzinowa)

max(stawka_godzinowa)

mean(stawka_godzinowa)

sum(stawka_godzinowa) / length(stawka_godzinowa)

median(stawka_godzinowa)

quantile(stawka_godzinowa, probs = 0.25)
quantile(stawka_godzinowa, probs = 0.75)
quantile(stawka_godzinowa, probs = c(0.25, 0.5, 0.75))

summary(stawka_godzinowa)



# Macierze
macierz <- matrix(1:9, nrow = 3, byrow = TRUE)
macierz
macierz[1,2]
macierz[3,]

# Listy
lista <- list(imie="Jan", wiek=32, wyniki=c(80, 90, 75))
lista


# Listybeznazw
lista_bez_nazw <- list("Jan", 32, c(80, 90, 75))

lista
lista$wiek

sum(lista$wyniki)

lista$wyniki[2]

str(lista)
?str()

### WEKTORY DAT ###

as.Date('2019-01-01') -> date; date

mode(date)

class(date)

class('2019-01-01')

# KONWERSJA DATE NA INNE TYPY
as.numeric(date)

class(date)

class(as.character(date))

as.numeric(as.Date('1970-01-01'))
as.numeric(as.Date('1969-01-01'))

# OPERACJE NA DATACH
as.Date('2018-01-01') < as.Date('2020-01-10')

as.Date('2018-01-01') + 1
# jak dodać miesiąc?

as.Date('2020-03-01') - 1


class(as.Date('2018-01-10') - as.Date('2018-01-01'))
as.Date('2018-01-10') - as.Date('2018-01-01')


roznica_dni_int <- as.numeric(as.Date('2018-01-10') - as.Date('2018-01-01'))
roznica_dni_int

format(as.Date('2018-01-14'), "%Y-%m") 

# Ramki danych
studenci <- data.frame(imie=c("Anna", "Tomek", "Ola", "Katarzyna"),
                       wiek=c(22, 24, 21, 27),
                       punkty=c(88, 92, 79, 98))

studenci
head(studenci) # wyswietla pierwsze 5 wierszy

str(studenci)
names(studenci)
studenci$punkty[2]



# WARTOSCI SPECJALNE
NA  # Not Available
Inf # Infinity
NaN # Not a Number

is.logical(NA)
is.numeric(Inf)
is.numeric(NaN)

# =====================================
# 3. OPERACJE NA DANYCH: WEKTORY I RAMKI DANYCH
# =====================================

# Indeksowanie i filtrowanie
studenci
studenci[studenci$punkty > 85, ]

studenci[studenci$wiek < 23 & studenci$punkty > 80, ]

# Dodawanie nowej kolumny
studenci$ocena <- ifelse(
  studenci$punkty > 90, "bardzo dobry",
  ifelse(studenci$punkty > 80, "dobry", "dostateczny")
)
studenci

# Sortowanie
studenci[order(studenci$punkty, decreasing = TRUE), ]

studenci

studenci_order <- studenci[order(studenci$punkty, decreasing = TRUE), ]
studenci_order


# Podstawowe statystyki
mean(studenci$punkty)
sd(studenci$punkty)

summary(studenci)

# =====================================
# 4. FUNKCJE 
# =====================================

print("cześć")

# Tworzenie własnych funkcji
kwadrat <- function(x) {
  wynik_kwadratu <- x^2
  return(cat("Liczba ", x, "podniesiona do kwadratu to:",  wynik_kwadratu))
}

funkcja_srednia <- function(x) { srednia_ocen <- mean(x); return(srednia_ocen) }
funkcja_srednia(c(2,5,2,3,4,5))
funkcja_srednia(oceny_do_funkcji)

oceny_do_funkcji <- c(2,5,2,3,4,5)
#wywołanie funkcji z podanym parametrem
kwadrat(5)
c(2,5,2,3,4,5)
### ZADANIE ###
# Stwórz funkcję, która przyjmie wektor ocen studenta i zwróci średnią z ocen 
funkcja_srednia <- function(x) {
  srednia_ocen <- mean(x)
  return(srednia_ocen)
}

oceny_studenta <- c(4,6)

funkcja_srednia(oceny_studenta)

?cat()


# Funkcja z wartościami domyślnymi
powitanie <- function(imie = "Student") {
  paste("Witaj,", imie)
}

powitanie()
powitanie("Joanna")

# Funkcja z warunkiem
ocena_punktowa <- function(punkty) {
  #print(punkty)
  if (punkty >= 90) {
    return("bardzo dobry")
  } else if (punkty >= 80) {
    return("dobry")
  } else {
    return("dostateczny")
  }
}

ocena_punktowa(90)



f_2_zmienne <- function (x,y) {
  z=x+y
  return(z)
}

f_2_zmienne(2,4)




### PĘTLE ###

# ============================
# PĘTLE W R – WPROWADZENIE
# ============================
#Napisz pętlę for, która wypisze wszystkie liczby parzyste 
#od 1 do 20. Użyj instrukcji if w środku pętli.

# FOR: klasyczna pętla for
for (i in 1:5) {
  print(paste("Liczba:", i))
}

licznik <- 1
repeat {
  print(paste("To jest repeat:", licznik))
  licznik <- licznik + 1
  if (licznik > 3) {
    break #next
  }
}

# FOR: iteracja po elementach wektora
owoce <- c("jabłko", "banan", "gruszka")
for (owoc in owoce) {
  print(paste("Owoc to:", owoc))
}

# WHILE: pętla while wykonuje się, dopóki warunek jest spełniony
i <- 1
while (i <= 3) {
  print(paste("i wynosi:", i))
  i <- i + 1
}

# REPEAT: wykonuje się w nieskończoność, dopóki nie napotka break
licznik <- 1
repeat {
  print(paste("To jest repeat:", licznik))
  licznik <- licznik + 1
  if (licznik > 3) {
    break
  }
}

# BREAK i NEXT w pętli FOR
for (i in 1:5) {
  if (i == 3) {
    next  # pomija i = 3
  }
  if (i == 5) {
    break  # przerywa pętlę gdy i = 5
  }
  print(paste("i =", i))
}


########

#ZADANIE 2
#Napisz pętlę for, która wypisze wszystkie liczby parzyste od 1 do 20. Użyj instrukcji if w środku pętli.

## ROZWIĄZANIE:
for (i in 1:20) {
  if (i %% 2 == 0) { print(i)}
  else next
}

# ZADANIE 3
#Napisz pętlę for, która policzy sumę tylko tych liczb, które są większe niż 10.


## Rozwiązanie:
x_3 <- c(4, 12, 8, 15, 3, 22)
y_suma <- 0
for (i in 1:length(x_3)) {
  if (x_3[i] > 10) { 
    y_suma <- y_suma + x_3[i]
  }
  else next
}
print (y_suma)
