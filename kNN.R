library(class)
library(doParallel)

train_set <- read.csv('train_data.csv')
test_set <- read.csv('test_data.csv')

my.cluster <- parallel::makeCluster(
  parallel::detectCores() -1
  ,type = 'PSOCK'
)

doParallel::registerDoParallel(cl = my.cluster)

set.seed(2137)
max_k <- 15
knn_test <- foreach(
  k = 1:max_k
  ,.combine = 'c'
) %dopar% {
  knn_predict = class::knn(train = train_set[,1:612]
                           ,test = test_set[,1:612]
                           ,cl = train_set$V613
                           ,k = k)

  conf_matrix = table(test_set$V613, knn_predict)
  sum(diag(conf_matrix)) / sum(conf_matrix)
}

parallel::stopCluster(cl = my.cluster)

plot(1:max_k, knn_test, type = 'l', ylim = c(0.75,0.85))
