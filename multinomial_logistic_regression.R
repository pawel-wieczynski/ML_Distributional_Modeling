library(nnet)

train_set <- read.csv('train_data.csv')
test_set <- read.csv('test_data.csv')

set.seed(2137)
multinom_model <- multinom(V613 ~ ., data = train_set, MaxNWts = 1e7)

prediction <- data.frame(
  Actual = test_set$V613
  ,Predicted = predict(multinom_model, newdata = test_set, 'class')
)

conf_matrix <- table(prediction$Actual, prediction$Predicted)

# Accuracy
sum(diag(conf_matrix)) / sum(conf_matrix)
