df <- read.delim("~/qbb2016-answers/week5/plink.eigenvec", header = F, sep = " ")
png("~/qbb2016-answers/week5/PCA.png")
plot(df$V3, df$V4, pch=19, col = adjustcolor("darkblue", alpha.f = .5), xlab = "PC-1", ylab = "PC-2", main = "PCA 1 and 2")
dev.off()

library("ggplot2")
ggplot(df, aes(x= V3, y= V4)) + geom_point(color = "darkblue", alpha = 0.5, size = 3) + labs(x="PC1", y= "PC2")
ggplot(df2, aes(x = MAF)) + geom_histogram(bins = 100, color = "blue")


df2 <- read.delim("~/qbb2016-answers/week5/alleles.txt", header = T)
png("~/qbb2016-answers/week5/MAF.png")
hist(df2$MAF, breaks = 100, col = "darkblue", xlab = "Allele Frequency", main = "MAF")
dev.off()


files = list.files("~/qbb2016-answers/week5", pattern = ".*qassoc", full.names = T)
for (i in files){
  temp = read.delim(i, header = T)
  name <- gsub("/Users/cmdb/qbb2016-answers/week5/plink.", "", i)
  name <- gsub(".qassoc", "", name)
  for (ii in 1:nrow(temp)){
    if (temp[ii,9] < .00001){ temp[ii,10] <- "red"}
    else {temp[ii,10] <- "black"}
  }
  par(mar=c(5,5,2,2))
  path_name <- gsub("qassoc", "png", i)
  png(path_name, width = 6, height = 3.5, units = "in", res = 1200, pointsize = 5)
  plot(rownames(temp), -log(temp$P), xaxt = 'n', pch = 19, col = adjustcolor(temp$V10, alpha = .25), xlab = "Chromosome", ylab = "-log(Pvalue)", main = paste("GWAS", name))
  axis(1, c(1,209, 1112, 1280, 2546, 3109, 3444, 4538, 4980, 5526, 6383, 7220, 8432, 9273, 9907, 10999), c("1","2","3","4", "5", "6", "7","8","9","10","11","12","13","14","15","16"), cex.axis = .75)
  abline(a=-log(.00001), b=0, lty=2, col = "Red", lwd = 2)
  dev.off()
}

