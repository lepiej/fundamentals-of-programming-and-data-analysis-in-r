# 1. Instalacja i ładowanie biblioteki (jeśli jej nie masz)
if (!requireNamespace("quantmod", quietly = TRUE)) {
  install.packages("quantmod")
}
library(quantmod)
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
library(dplyr)


# Symbol (ticker) S&P 500 w Yahoo Finance
ticker_sp500 <- "^GSPC" 

# Data początkowa (1 stycznia bieżącego roku)
rok_biezacy <- format(Sys.Date(), "%Y")
data_start <- paste0(rok_biezacy, "-01-01") 

# Nazwa pliku do zapisu
nazwa_pliku_csv <- "sp500_ceny_zamkniecia_od_poczatku_roku.csv"


# 3. Pobieranie danych z Yahoo Finance
#getSymbols pobiera dane jako obiekt xts i tworzy zmienna o nazwie tickera - GSPC
getSymbols(ticker_sp500, src = "yahoo", from = data_start)

# 4. Przygotowanie danych do zapisu

# a) Konwersja obiektu xts na ramkę danych (data.frame)
dane_sp500 <- data.frame(Data = index(GSPC), coredata(GSPC))

# b) Wybranie tylko kolumny z datą i ceną zamknięcia (Close)
# Kolumna z ceną zamknięcia ma nazwę 'GSPC.Close'
dane_csv <- dane_sp500 %>%
  select(Data, Cena_Zamkniecia = GSPC.Close)


# 5. Zapis do pliku CSV
write.csv(dane_csv, 
          file = nazwa_pliku_csv, 
          row.names = FALSE, # Ważne: usuwa automatyczny wiersz indeksów
          fileEncoding = "UTF-8")

# 6. Komunikat dla użytkownika
cat(paste0("Ceny zamknięcia S&P 500 od ", data_start, " zostały zapisane do pliku: '", nazwa_pliku_csv, "'\n"))