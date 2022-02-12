set.seed(2137)

distributions <- c('beta', 'cauchy', 'chisq', 'exp', 'f', 'gamma', 'lnorm', 'norm', 't', 'unif', 'weibull')
sample_sizes <- c(100, 1000)
dataset_size <- 250 # per each pair (distribution, sample_size)
kde_points <- 512
quantiles <- seq(0.01 ,1, by = 0.01)

dataset <- data.frame()

for (i in 1:length(distributions)) {
  
  for (j in 1:length(sample_sizes)) {
    
    for (k in 1:dataset_size) {
      
      x_sample <- switch(distributions[i]
                         ,'beta' = get(paste0('r', distributions[i]))(sample_sizes[j]
                                                                      ,shape1 = runif(1, 1e-5, 10)
                                                                      ,shape2 = runif(1, 1e-5, 10))
                         ,'cauchy' = get(paste0('r', distributions[i]))(sample_sizes[j])
                         ,'chisq' = get(paste0('r', distributions[i]))(sample_sizes[j]
                                                                       ,df = runif(1, 1e-5, 10))
                         ,'exp' =  get(paste0('r', distributions[i]))(sample_sizes[j]
                                                                      ,rate = runif(1, 1e-5, 10))
                         ,'f' =  get(paste0('r', distributions[i]))(sample_sizes[j]
                                                                    ,df1 = runif(1, 1e-5, 10)
                                                                    ,df2 = runif(1, 1e-5, 10))
                         ,'gamma' = get(paste0('r', distributions[i]))(sample_sizes[j]
                                                                       ,shape = runif(1, 1e-5, 10))
                         ,'lnorm' = get(paste0('r', distributions[i]))(sample_sizes[j])
                         ,'norm' = get(paste0('r', distributions[i]))(sample_sizes[j])
                         ,'t' = get(paste0('r', distributions[i]))(sample_sizes[j]
                                                                   ,df = runif(1, 1e-5, 10))
                         ,'unif' = get(paste0('r', distributions[i]))(sample_sizes[j])
                         ,'weibull' = get(paste0('r', distributions[i]))(sample_sizes[j]
                                                                         ,shape = runif(1, 1e-5, 10))
      )
      
      y_density <- density(x_sample, n = kde_points)$y
      q_sample <- quantile(x_sample, quantiles)
      
      last_row <- dim(dataset)[1]
      dataset[last_row + 1, 1:kde_points] <- y_density
      dataset[last_row + 1, (kde_points + 1):(kde_points + length(quantiles))] <- q_sample
      dataset[last_row + 1, kde_points + length(quantiles) + 1] <- distributions[i]
      
    }
    
  }
  
}

write.csv(dataset, 'mldm_dataset.csv')
