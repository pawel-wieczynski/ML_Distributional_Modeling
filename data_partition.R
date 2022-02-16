dataset <- read.csv('mldm_dataset.csv')[-1]
dataset[,1:612] <- scale(dataset[,1:612]
                         ,center = sapply(dataset[,1:612], min)
                         ,scale = sapply(dataset[,1:612], max) - sapply(dataset[,1:612], min))

set.seed(2137)
nrow <- dim(dataset)[1]
index <- sample(1:nrow, 0.75 * nrow)
train_set <- dataset[index,]
test_set <- dataset[-index,]
write.csv(train_set, 'train_data.csv', row.names = FALSE)
write.csv(test_set, 'test_data.csv', row.names = FALSE)



