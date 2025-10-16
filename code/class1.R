wektor <- c(10, 20, 30, 80, 50)
wektor[1]

zmienna_z_wektorem = c(2,10,20)
?c()
wektor[1]
wektor[2:4]

wektor[-2]
wektor[2:length(wektor)]
length(wektor)
wektor +5
wekrot = wektor+5
log(wektor)
wektor >25

c(1,2,3,4,1) -> wektor_2; wektor_2
2 -> wektor_2[1]
wektor * wektor_2

c(pon=24, wto=35, sro=28,czw=32,pia=47,sob=44) ->stawka_godzinowa;
wektor
sorted_wektor <- sort(wektor)
rank(wektor)
rev(wektor)
sum(stawka_godzinowa)
nim(stawka_godzinowa)
min(stawka_godzinowa)
max(stawka_godzinowa)
mean(stawka_godzinowa)

macierz <- matrix(1:9, nrow = 3, byrow = 3)
macierz[1,2]
macierz[,3]
lista <- list (imie="Jan",wiek=32, wyniki=c(80,90,75) )
lista_bez_nazw <- list("Jan", 32, c(80,90,75))
lista$wiek
lista$imie
str(lista)
?str()
as.Date('2019-01-01') -> date;
mode(date)
class(date)
as.numeric(date)
as.character(date)
as.numeric(as.Date('1970-01-01'))
as.numeric(as.Date('1969-01-01'))
as.Date('2018-01-01') < as.Date('2020-01-01')
as.Date('2018-01-01') -1
as.Date('2018-01-01') + 6364


studenci <- data.frame(imie=c("Anna", "Tomek", "Ola", "Katarzyna"), wiek =c(22,24,21,27), punkty=c(88,92,79,98))
names(studenci)
str(studenci)
studenci$punkty
studenci
studenci[studenci$punkty>85,]
studenci$ocena <- ifelse(studenci$punkty >90, "bardzo dobry", ifelse(studenci$punkty >80, "dobry", "dostateczny"))
studenci
studenci_order <- studenci[order(studenci$punkty,decreasing = TRUE),]
mean(studenci$punkty)
sd(studenci$punkty)
summary(studenci)

kwadrat <- function(x) { 
  wynik_kwadratu <- x^2 
  return(cat("Liczba ", x, "podniesiona do kwadratu to:", wynik_kwadratu))
  }
kwadrat(10)
ftest <- function(x){mean(x) return(x)} 
kwadrat <- function(x) {
  wynik_kwadratu <- x^2
  cat("Liczba", x, "podniesiona do kwadratu to:", wynik_kwadratu, "\n")
}
kwadrat(160)

powitanie <- function(imie = "Student") {
  paste("Witaj,", imie)
}
powitanie()

ocena_punktowa <- function(punkty) {
  print(punkty)
  if(punkty >= 90) return("bardzo dobry")
  ifelse(punkty >= 80) return("dobry"),
  return("dostateczny")
}
ocena_punktowa(studenci)
