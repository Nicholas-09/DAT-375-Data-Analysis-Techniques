install.packages("tframe");
install.packages("tfplot");
library("tframe");
library("tfplot");

# Set your working directory
setwd("C:/Users/Public/Desktop/DAT-375")

# Load the CSV files
crimestormdataQ <- read.csv("crimeStormQ.csv")
print(crimestormdataQ)

crimenostormdataQ <- read.csv("crimenostormQ.csv")
print(crimenostormdataQ)

# Convert the 'Loss' columns to time series (in thousands of dollars)
z <- ts(cumsum(crimenostormdataQ$Loss) / 1000, start = c(2017, 1), frequency = 12)
x <- ts(cumsum(crimestormdataQ$Loss) / 1000, start = c(2017, 1), frequency = 12)

# Plot the first time series
plot(z, type = "l", col = "blue", lwd = 2,
     ylab = "Victim Loss in K$",
     xlab = "By Month by Year",
     main = "Victim Loss From Crimes for Jan 2017 - Dec 2019")

# Add the second time series to the same plot
lines(x, col = "red", lty = 2, lwd = 2)

# Add a legend
legend("topleft", legend = c("No Storm", "Storm"),
       col = c("blue", "red"), lty = c(1, 2), lwd = 2)

# Optional: Add a subtitle using mtext
mtext("Cumulative Loss in Thousands of Dollars", side = 3, line = 0.5, cex = 0.9)
