GGPLOT2 <- read.csv('GGPLOT2.csv')
TMP <- GGPLOT2
TMP$METRIC <- factor(TMP$METRIC, levels = c('GLOBAL EFFICIENCY', 'LOCAL EFFICIENCY', 'CLUSTERING COEFFICIENT', 'SHORTEST PATH LENGTH', 'GAMMA', 'SIGMA', 'STRENGTH'), ordered = TRUE)

FIG <- ggplot(data = TMP, mapping = aes(x = GROUP, y = MEAN)) +
facet_wrap(~METRIC, scales = 'free') +

geom_bar(mapping = aes(fill = GROUP), stat = 'identity', width = 0.5, color = 'black', size = 0.8) +
geom_errorbar(mapping = aes(ymin = MEAN - SD, ymax = MEAN + SD), width = 0.2, size = 1) +

geom_point(aes(y = YLIM)) +
labs(x = '', y = '') +
theme(legend.position = 'bottom') +
theme(axis.ticks.x = element_blank(), axis.text.x = element_blank()) +
theme(text = element_text(size = 8, face = 'bold'))