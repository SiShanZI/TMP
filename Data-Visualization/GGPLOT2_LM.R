# DF <- read.csv('')
# library(ppcor)
# library(ggplot2)
# library(grid)
# 5
#
#
TMP <- c()
for(i in 1:90){
#
## i in 1:90, 1:48 ##
#
FIT <- aov(DF[, i+7] ~ AGE + GENDER + CENTER + GROUP, DF)
TMP <- c(TMP, summary(FIT)[[1]]["Pr(>F)"][[1]][4])
}
IDX1 <- which(p.adjust(TMP, method = "fdr") <= 0.05)
#
#
IDX2 <- list(NMO_0 = c(), NMO_1 = c(), NMO_2 = c())
for(i in IDX1){
TMP <- TukeyHSD(aov(DF[, i+7] ~ AGE + GENDER + CENTER + GROUP, DF), which = 'GROUP')
for(j in 1:3){
if(TMP$GROUP[j, 4] <= 0.05){
TMP_DF <- DF[DF$GROUP == paste('NMO_', as.character(j-1), sep = ''),]
#
## TMP_DF$EDSS, TMP_DF$DD ##
#
TMPj <- pcor.test(TMP_DF[, i+7], TMP_DF$EDSS, c(TMP_DF$AGE, TMP_DF$GENDER, TMP_DF$CENTER))
if(TMPj$p.value <= 0.05 & abs(TMPj$estimate) >= 0){IDX2[[j]] = c(IDX2[[j]], i)}
}
}
}
IDX3 <- unique(sort(c(IDX2[[1]], IDX2[[2]], IDX2[[3]])))
#
#
# The code below is for CORRELATION PLOT
COR_RP <- c()
for(i in IDX3){
for(j in 1:3){
TMP_DF <- DF[DF$GROUP == paste('NMO_', as.character(j-1), sep = ''),]
#
## TMP_DF$EDSS, TMP_DF$DD ##
#
TMPj <- pcor.test(TMP_DF[, i+7], TMP_DF$EDSS, c(TMP_DF$AGE, TMP_DF$GENDER, TMP_DF$CENTER))
COR_RP <- cbind(COR_RP, c(TMPj$estimate, TMPj$p.value))
}
}
#
#
FLAG <- 0
RES <- DF[DF$GROUP != 'HC',]
for(i in IDX3){
#
#
TEXT_0 <- paste('r = ', signif(COR_RP[1, 3*FLAG + 1], 4), '; ', 'p = ', signif(COR_RP[2, 3*FLAG + 1], 4), sep = '')
TEXT_1 <- paste('r = ', signif(COR_RP[1, 3*FLAG + 2], 4), '; ', 'p = ', signif(COR_RP[2, 3*FLAG + 2], 4), sep = '')
TEXT_2 <- paste('r = ', signif(COR_RP[1, 3*FLAG + 3], 4), '; ', 'p = ', signif(COR_RP[2, 3*FLAG + 3], 4), sep = '')
FLAG <- FLAG + 1
GP <- gpar(fontsize = 7, fontface = 4)
Grob1 <- grobTree(textGrob(TEXT_0, x = 0.1,  y = 0.90, just = 0, gp = GP))
Grob2 <- grobTree(textGrob(TEXT_1, x = 0.1,  y = 0.85, just = 0, gp = GP))
Grob3 <- grobTree(textGrob(TEXT_2, x = 0.1,  y = 0.80, just = 0, gp = GP))
#
## x = EDSS, DD ##
#
FIG <- ggplot(data = RES, mapping = aes(x = EDSS, y = RES[, i+7], color = GROUP)) +
theme_bw() +
geom_point(mapping = aes(shape = GROUP), size = 1) +
geom_smooth(method = 'lm', se = FALSE, size = 1) +
scale_color_manual(values = c('blue3', 'orange3', 'cyan3')) +

theme(text = element_text(face = 'bold')) +
theme(strip.text = element_blank()) +
labs(x = '', y = '', title = colnames(RES)[i+7]) +
theme(legend.position = 'none') +
theme(axis.text = element_text(size = 6)) +
annotation_custom(Grob1) +
annotation_custom(Grob2) +
annotation_custom(Grob3)
#
## COR ##
#
ggsave(paste('COR_EDSS_VBM_', sprintf('%02d', i), '.jpg'), FIG, 'jpg', dpi = 600)
}
