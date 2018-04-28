


num_samples <- 50000
data <- rexp(num_samples, 0.2)
x <- data.frame(X = seq(1, num_samples , 1), Y = sort(data))
plot(x)
y <- matrix(data,500)
for(i in 1:5){
	pdata <- rep(0,100);
	for(j in 1:100){
		val= round(y[i,j], 0);
	    if(val <= 100){
		  pdata[val] = pdata[val] + 1/num_samples;
	  }
	}
	xcols <- c(0:99);
	plot(xcols,pdata, "l", xlab = "X", ylab = "f(X)");

	cdata <- rep(0,100);
	cdata[1] <- pdata[1];

	for(j in 2:100){
		cdata[j] = cdata[j-1] + pdata[j];

	}
	plot(xcols,cdata, "o" ,col= "blue", xlab ="X", ylab ="F(X)" );

}
means <- apply(y,1,mean)
ssd <- apply(y,1,sd)
for(i in 1:5){
	cat(means[i]);
	cat("\n");
	cat(ssd[i]);
	cat("\n");
}

tab <- table(round(means));

plot(tab,"h", xlab="Value", ylab= "Frequency")

pdata1 <- rep(0,10);
for(j in 1:100){
    val1= round(means[j], 0);
	if(val1 <= 10){
		pdata1[val1] = pdata1[val1] + 1/100;
	}
}
xcols <- c(0:9);
plot(xcols,pdata1, "l", xlab = "X", ylab = "f(X)");

cdata1 <- rep(0,10);
cdata1[1] <- pdata1[1];

for(j in 2:10){
	cdata1[j] = cdata1[j-1] + pdata1[j];

}
plot(xcols,cdata1, "o" ,col= "blue", xlab ="X", ylab ="F(X)" );

smean = mean(means);
sdmean = sd(means);

cat(smean);
cat("\n");
cat("Original mean is 5");
cat("\n");
cat(sdmean);
cat("\n");
cat("Original standard deviation is 0.5");
