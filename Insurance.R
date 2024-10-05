library(rpart)
library(ggplot2)
library(lattice)
library(rpart.plot)
library(caret)
#install.packages("pROC")
library(pROC)
library(tidyverse)
library(ggplot2)
library(dplyr)


Car_data <- read.csv("final_dataset.csv")

#Missing values
summary_nas <- data.frame(miss.val = sapply(Car_data, function(x) sum(is.na(x))))
summary_nas

# partition of data set
# 70% data contained in training
set.seed(1)
train_index <- sample(c(1:dim(Car_data)[1]), dim(Car_data)[1]*0.7)
training <- Car_data[train_index, ]
# 30% data contained in validation
validation <- Car_data[-train_index, ]

# Logit model for training
logit_reg_train <- glm(CarInsurance~., data = training, family = "binomial")
options(scipen=0)
summary(logit_reg_train)

# Logit predictions for training
logit.reg.pred.train <- predict(logit_reg_train, training, type = "response")
confusionMatrix(as.factor(ifelse(logit.reg.pred.train > 0.5, 1, 0)),
                as.factor(training$CarInsurance))

# ROC Curves for training data
# R_L_train <- roc(training_L$Churn, logit.reg.pred.train, auc = T)
# plot.roc(R_L_train)
# auc(R_L_train)

# Logit predictions for validation
logit.reg.pred.valid <- predict(logit_reg_train, validation, type = "response")
confusionMatrix(as.factor(ifelse(logit.reg.pred.valid > 0.5, 1, 0)),
                as.factor(validation$CarInsurance))
# ROC Curves for validation data
# R_L_Valid <- roc(validation_L$Churn, logit.reg.pred.valid, auc = T)
# plot.roc(R_L_Valid)
# auc(R_L_Valid)

OR <- exp(coef(logit_reg_train)); OR

pvalues <- coef(summary(logit_reg_train))[,'Pr(>|z|)'] ; pvalues

# 2.a.c
df1 <- data.frame(OddsRatio = OR, PValues = pvalues); df1

# 2.a.d
print(df1)

# 2.b
sd_calibration <- sapply(training, sd); sd_calibration

# 2.b.a
missing_sd <- is.na(sd_calibration); missing_sd

# 2.b.b
sd_function_na_rm <- function(x) {sd(x, na.rm = TRUE)}; sd_function_na_rm

sd_calibration_new <- sapply(training, sd_function_na_rm); sd_calibration_new

# 2.b.c
df2 <- data.frame( StandardDeviation_new = sd_calibration_new)
print(df2)

# 2.c

# 2.c.a
df1$VarName <- row.names(df1); df1
df2$VarName <- row.names(df2); df2

# 2.c.b
merged_df <- merge(df1, df2, by = "VarName", all = FALSE)
print(merged_df)

# 2.d

merged_df[, sapply(merged_df, is.numeric)] <- round(merged_df[, sapply(merged_df, is.numeric)], 5)
merged_df
write.csv(merged_df, file = "merged_df.csv", row.names = FALSE)

write.csv(df1, file = "df1.csv", row.names = FALSE)