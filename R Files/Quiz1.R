df <- read.csv('Misc Files\\hw1_data.csv')
dim(df)
df[c(1, 2), ]
df[c(152, 153), ]
df$Ozone[47]
sum(is.na(df$Ozone))
mean(df$Ozone[!is.na(df$Ozone)])
sub <- df[df$Ozone > 31, ]
sub <- sub[sub$Temp > 90, ]
sub <- sub$Solar.R[!is.na(sub$Solar.R)]
mean(sub)
mean(df$Temp[df$Month == 6])
sub2 <- df$Ozone[df$Month == 5]
sub2 <- sub2[!is.na(sub2)]
max(sub2)