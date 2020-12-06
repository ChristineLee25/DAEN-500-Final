myCourses <- c('MATH 290', 'MATH 203', 'MATH 213', 'MATH 214', 'MATH 351', 
			'MATH 441', 'MATH 554', 'MATH 555')
length(myCourses)
myCourses[1:2]
myCourses[3:4]
sort(myCourses)
sort(myCourses, decreasing = TRUE)

#Problem 5
library("ggplot2")
library("broom")
library("dplyr")
library("modelr")
data <- na.omit(read.csv("C:/Users/Christine/Desktop/DAEN 500/day.csv", header = TRUE))

#Multiple regression
multReg <- lm(cnt~atemp+hum, data = data)
multRegPlot <- ggplot(data, aes(x = atemp, y = hum)) +
		   geom_point(aes(color = cnt))
grid <- data %>%  
	data_grid(
		atemp = seq_range(atemp, n = length(atemp)),
		hum = seq_range(hum, n = length(atemp))
	)
mod <- lm(cnt~atemp+hum, data = data)
cnt_hats <- augment(mod, newdata = grid)
multRegPlot +   
	geom_tile(data = cnt_hats, aes(fill = .fitted, alpha = 0.5)) +   
	scale_fill_continuous("cnt", limits = range(data$cnt)) +
	labs(title = "Multiple Regression")

#Logistic regression
plot.new()
logReg <- glm(workingday~casual, data = data, family = binomial)
logRegPlot <- ggplot(data, aes(x = casual, y = workingday)) +
		   geom_jitter(width=0,height=0.05,alpha=0.5)
logRegPlot +
	geom_smooth(method="glm", se=FALSE, method.args = list(family=binomial)) +
	labs(title="Logistic Regression")
