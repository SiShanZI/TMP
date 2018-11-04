# DF <- read.csv()
# library(ggplot2)
#
#
TMP <- c()
for(i in 1:90){  ###
FIT <- aov(DF[, i+7] ~ AGE + GENDER + CENTER + GROUP, DF)
TMP <- c(TMP, summary(FIT)[[1]]["Pr(>F)"][[1]][4])
}
IDX <- which(p.adjust(TMP, method = "fdr") <= 0.05)
#
#
RES <- c()
for(i in IDX){
FIT <- aov(DF[, i+7] ~ AGE + GENDER + CENTER + GROUP, DF)
TMP1 <- data.frame(GROUP = DF[, 1], N = predict(FIT, newdata = data.frame(AGE = rep(40, 130), GENDER = rep('F', 130), CENTER = rep('T', 130), GROUP = DF$GROUP)) + FIT$residuals)
TMP2 <- data.frame(GROUP = c('HC', 'NMO_0', 'NMO_1', 'NMO_2'), IDX = rep(colnames(DF)[i+7], 4), MEAN = c(mean(TMP1$N[TMP1$GROUP == 'HC']), mean(TMP1$N[TMP1$GROUP == 'NMO_0']), mean(TMP1$N[TMP1$GROUP == 'NMO_1']), mean(TMP1$N[TMP1$GROUP == 'NMO_2'])), SD = c(sd(TMP1$N[TMP1$GROUP == 'HC']), sd(TMP1$N[TMP1$GROUP == 'NMO_0']), sd(TMP1$N[TMP1$GROUP == 'NMO_1']), sd(TMP1$N[TMP1$GROUP == 'NMO_2'])))
RES <- rbind(RES, TMP2)
}
#RES$FACET <- c(rep('a', 104), rep('b', 100))
RES$FACET <- c(rep('a', 68), rep('b', 68), rep('c', 68))
#
#
FIG <- ggplot(data = RES, mapping = aes(x = IDX, y = MEAN, fill = GROUP)) +
theme_bw() +
facet_wrap(~FACET, nrow = 3, scales = 'free') +
geom_bar(stat = 'identity', position = position_dodge(0.7), width = 0.7, color = 'black', size = 0.2) +
geom_errorbar(aes(ymin = MEAN - SD, ymax = MEAN + SD), position = position_dodge(0.7), width = 0.02) +
labs(x = 'AAL Regions', y = 'Volume') +
ylim(0, 20000) +
theme(legend.position = 'bottom') +
theme(strip.text = element_blank(), axis.ticks.x = element_blank(), axis.text.x = element_text(angle = 45)) +
theme(text = element_text(size = 8, face = 'bold'))