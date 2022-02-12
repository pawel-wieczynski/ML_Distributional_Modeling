
Different classification algorithms will be trained there in order to
predict distribution of a given sample.

Dataset was generated using 11 continuous distributions available in
*stats* package: 250 samples for each pair (distribution, size), where
size is either 100 or 1000 gives us total number of 5500 observations.
It was splitted 75:25 into training set and test set.

Dataset consists of 613 attributes:  
- V1, …, V512 - y coordinates of kernel density estimation (Guassian
kernel with *nrd0* rule for bandwith selection)  
- V513, …, V612 - sample quantiles  
- V613 - target class.

Parameters of the generated distributions are:  
- **beta** distribution with both shape parameters from uniform(0, 10)  
- standard **Cauchy** distribution  
- **chi-squared** distribution with uniform(0, 10) degrees of freedom  
- **exponential** distribution with uniform(0, 10) rate of decay  
- **F-Snedecor** distribution with both degrees of freedom from
uniform(0, 10)  
- **gamma** distribution with uniform(0, 10) shape and unit scale  
- standard **log-normal** distribution  
- standard **normal** distribution  
- **-t-Studen** distribution with uniform(0, 10) degrees of freedom  
- **uniform\[0,1\]** distribution (which has the same support as beta
distribution)  
- **Weibull** distribution with uniform(0, 10) shape and unit scale.
