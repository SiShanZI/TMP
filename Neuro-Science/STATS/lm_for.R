#setwd("C:/Users/Sue/Desktop") ###
gg <- read.csv('RD.csv') ###
idx <- c()
P <- c()
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
#idx <- rbind(idx, t(c(i, Fp, Tp, summary(fit)$coefficients[, 1], summary(fit)$coefficients[, 4])))
}
#
}
#idx <- data.frame(idx)
#if(nrow(idx) != 0){
###
#names(idx) <- c('id', 'Fp', 'Tp', 'Intercept', 'centerXW', 'genderM', 'age', 'groupnmo', 'age:groupnmo', 'p1', 'p2', 'p3', 'p4', 'p5', 'p6')
#names(idx) <- c('id', 'Fp', 'Tp', 'Intercept', 'centerXW', 'age', 'genderM', 'groupnmo', 'genderM:groupnmo', 'p1', 'p2', 'p3', 'p4', 'p5', 'p6')
#write.csv(idx, 'idx_neg_gender.csv')
###
#}
#interaction effect
#wm_voln_fit <- summary(fit)$residuals + predict(fit, newdata = data.frame(center = rep('T', 138), gender = rep('F', 138), age = df$age, group = df$group))
#summary(lm(wm_voln_fit[df$group == 'nc'] ~ df$age[df$group == 'nc']))
#
#gg <- na.omit(read.csv('Par_loc.csv', na.string=c("NA", "")))
#fit <- lm(gg[, 4 + 7] ~ center + age + gender + group + gender:group, gg)
#Nloc_fit <- summary(fit)$residuals + predict(fit, newdata = data.frame(center = rep('T', 138), age = rep(0, 138), gender = gg$gender, group = gg$group))
#summary(lm(Nloc_fit[gg$group == 'nc'] ~ gg$gender[gg$group == 'nc']))
#summary(lm(Nloc_fit[gg$gender == 'F'] ~ gg$group[gg$gender == 'F']))
