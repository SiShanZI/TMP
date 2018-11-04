#setwd("C:/Users/Sue/Desktop") ###
library(ggplot2)
gg <- read.csv('FA.csv') ###
idx <- c(); P <- c()
#
for(i in 1:48){
#
fit <- lm(gg[, i+4] ~ gender + age + edu + group, gg) ###
Fp <- 1 - pf(summary(fit)$fstatistic[1], summary(fit)$fstatistic[2], summary(fit)$fstatistic[3])
Tp <- summary(fit)$coefficients[5, 4]
#
P <- c(P, Tp)
if(Fp <= 0.05 & Tp <= 0.05){
idx <- c(idx, i)
}
}
#
df <- data.frame()
for(i in idx){
fit <- lm(gg[, i+4] ~ gender + age + edu + group, gg) ###
Y <- summary(fit)$residuals + predict(fit, newdata = data.frame(gender = rep('F', 40), age = rep(0, 40), edu = rep(0, 40), group = gg$group))
df <- rbind(df, data.frame(group = gg$group, gn = c(rep(0, 20), rep(1, 20)), JHU = rep(as.character(i), 40), Y = Y, Mean = c(rep(mean(Y[1:20]), 20), rep(mean(Y[21:40]), 20)), Sd = c(rep(sd(Y[1:20]), 20), rep(sd(Y[21:40]), 20))))
}
#
Fig <- ggplot(data = df, mapping = aes(x = gn, y = Y)) +
facet_grid(. ~ JHU) +
labs(x = '', y = 'FA', title = 'JHU labels') + xlim(-0.5, 1.5) + ###
theme(axis.ticks.x = element_blank(), axis.text.x = element_blank()) +
geom_errorbar(aes(ymin = Mean - Sd, ymax = Mean + Sd)) +
geom_smooth(aes(x = gn, y = Y), method = lm, se = FALSE) +
geom_point(aes(color = group), alpha = 1/2)

