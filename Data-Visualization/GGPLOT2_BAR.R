# DF <- read.csv()
# library(ggplot2)
# library(dplyr)
# library(reshape2)
# library(latex2exp)
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
# IDX <- c(3, 4, 5, 6, 12, 15, 16, 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 39, 40, 42, 43, 44, 47, 48)  ###
#
#
RES <- data.frame(GROUP = DF$GROUP)
for(i in IDX){
FIT <- aov(DF[, i+7] ~ AGE + GENDER + CENTER + GROUP, DF)
# Fitted values
TMP <- data.frame(N = predict(FIT, newdata = data.frame(AGE = rep(40, 130), GENDER = rep('F', 130), CENTER = rep('XW', 130), GROUP = DF$GROUP)) + FIT$residuals)
colnames(TMP)[1] = colnames(DF)[i+7]
RES <- cbind(RES, TMP)
}
#
#
# dplyr(group_by, %>%, summarize_all, full_join), reshape2 (melt)
TMP_mean <- data.frame(group_by(RES, GROUP) %>% summarize_all(funs(mean)))
TMP_mean <- melt(data = TMP_mean, measure.vars = colnames(TMP_mean[, -1]), id.vars = 'GROUP', variable.name = 'ROI', value.name = 'MEAN')
TMP_sd <- data.frame(group_by(RES, GROUP) %>% summarize_all(funs(sd)))
TMP_sd <- melt(data = TMP_sd, measure.vars = colnames(TMP_sd[, -1]), id.vars = 'GROUP', variable.name = 'ROI', value.name = 'SD')
RES <- full_join(x = TMP_mean, y = TMP_sd, by = c('GROUP', 'ROI'))
#
#
RES$FACET2 <- c(rep('a', 104), rep('b', 100))
# RES$FACET3 <- c(rep('a', 68), rep('b', 68), rep('c', 68))
#
#
FIG <- ggplot(data = RES, mapping = aes(x = ROI, y = MEAN, fill = GROUP)) +
theme_bw() +
#
# coord_flip() +
#
facet_wrap(~FACET2, nrow = 2, scales = 'free') +
#
#
geom_bar(stat = 'identity', position = position_dodge(0.8), width = 0.8) +
geom_errorbar(aes(ymin = MEAN - SD, ymax = MEAN + SD, color = GROUP), position = position_dodge(0.8), width = 0.8, size = 0.3) +
#
#
theme(text = element_text(face = 'bold')) +
theme(strip.text = element_blank()) +
#
# axis
#
theme(axis.title = element_text(size = 8), 
      axis.ticks.x = element_blank(), axis.text.x = element_text(size = 6, angle = 45), 
      axis.text.y = element_text(size = 6)) +
#
# legend
#
theme(legend.direction = 'horizontal', legend.position = c(0.8, 0.95), 
      legend.title = element_blank(), legend.background = element_blank(), 
      legend.text = element_text(size = 8), 
      legend.key.size = unit(3, 'mm')) +
#
# customize ticks
#
scale_x_discrete(name = 'AAL Regions') +
scale_y_continuous(name = 'Volume', limits = c(0, 20000)) +
#                   breaks = c(0.00, 0.25, 0.50, 0.75, 1.00), 
#                   labels = c('0.0000', '0.2500', '0.5000', '0.7500', '1.0000')) +
#
# color
#
scale_color_manual(values = c('red3', 'blue3', 'orange3', 'cyan3')) +
scale_fill_manual(values = c('red3', 'blue3', 'orange3', 'cyan3'))
#
# save
#
ggsave('TMP.bmp', FIG, device = 'bmp', width = 150, height = 95, units = 'mm', dpi = 600, limitsize = FALSE)
