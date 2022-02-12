set.seed(2137)
index <- caret::createDataPartition(dataset$V613, p = 0.75, list = FALSE)
train_set <- dataset[index,]
test_set <- dataset[-index,]
write.csv(train_set, 'train_data.csv', row.names = FALSE)
write.csv(test_set, 'test_data.csv', row.names = FALSE)
