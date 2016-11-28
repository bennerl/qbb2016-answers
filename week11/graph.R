####################################################################################
df <- read.delim("~/qbb2016-answers/week11/hema_data.txt", header = T)
rownames(df) <- df$gene
df <- df[,-c(1)]
df <- df[,c(1,5,6,4,3,2)]
mydata <- scale(df) # standardize variables
d <- dist(mydata, method = "euclidean") # distance matrix
fit <- hclust(d, method = "complete") 
plot(fit) # display dendogram

png("~/qbb2016-answers/week11/heatmap_cells.png", width = 6, height = 3.5, units = "in", res = 1200, pointsize = 5)
heatmap(mydata, Rowv = fit$order)
dev.off()
png("~/qbb2016-answers/week11/heatmap.png", width = 6, height = 3.5, units = "in", res = 1200, pointsize = 5)
heatmap(mydata, Rowv = fit$order, Colv = NA)
dev.off()
####################################################################################
library("ggplot2")
df <- read.delim("~/qbb2016-answers/week11/hema_data.txt", header = T)
rownames(df) <- df$gene
df <- df[,-c(1)]
df <- df[,c(1,5,6,4,3,2)]
mydata <- scale(df) # standardize variables
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydata, centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares")
fit <- kmeans(mydata, 5) # 5 cluster solution
aggregate(mydata, by=list(fit$cluster),FUN=mean)
mydata <- data.frame(mydata, fit$cluster)
mydata$color[mydata$fit.cluster == 1] <- "green"
mydata$color[mydata$fit.cluster == 2] <- "red"
mydata$color[mydata$fit.cluster == 3] <- "blue"
mydata$color[mydata$fit.cluster == 4] <- "orange"
mydata$color[mydata$fit.cluster == 5] <- "yellow"
png("~/qbb2016-answers/week11/expression.png", width = 6, height = 3.5, units = "in", res = 1200, pointsize = 5)
ggplot(mydata, aes(x = mydata$CFU, y = mydata$poly)) + geom_point(color = mydata$color, alpha = .5) + labs(x="CFU RPKM", y = "Poly RPKM") + ggtitle("Poly vs CFU Expression")
dev.off()
res <- mydata
####################################################################################
df <- read.delim("~/qbb2016-answers/week11/hema_data.txt", header = T)
rownames(df) <- df$gene
df <- df[,-c(1)]
df <- df[,c(1,5,3,2)]
df_new <- df

for (i in 1:nrow(df)){
  temp_df <- data.frame()
  row_num <- 1
  for (ii in 1:ncol(df)){
    temp_df[row_num, 1] <- df[i, ii]
    row_num = row_num + 1
  }
  temp_df$V2 <- c("early", "early", "late", "late")
  col_mean <- mean(temp_df[,1])
  if (temp_df[1,1] == col_mean){
    df_new[i, ncol(df) + 1] <- 1
    df_new[i, ncol(df) + 2] <- 2
  }
  else {
  a <- (t.test(temp_df$V1~temp_df$V2))
  df_new[i, ncol(df) + 1] <- a$p.value
  b <- data.frame(a$estimate)
  late_val <- b[2,1]
  early_val <- b[1,1]
  diff <- log2(late_val / early_val)
  df_new[i, ncol(df) + 2] <- diff
  }
}
colnames(df_new)[ncol(df_new) - 1] <- "pvalue"
colnames(df_new)[ncol(df_new)] <- "diff"
df_sig <- df_new[df_new$pvalue < .05,]
write.table(df_sig, "~/qbb2016-answers/week11/differentially_expressed_genes.txt", row.names = F, col.names = F, quote = F, sep = "\t")

res_clust <- res[rownames(res) == "2310046K01Rik",]
res_clust <- res[res$fit.cluster == "2",]
df_sig$id <- rownames(df_sig)
res_clust$id <- rownames(res_clust)
prac <- merge(res_clust, df_sig, by = "id")
prac <- data.frame(prac$id)
write.table(prac, "~/qbb2016-answers/week11/panther_analysis.txt", row.names = F, col.names = F, quote = F, sep = "\t")



