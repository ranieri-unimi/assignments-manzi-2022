sample = c(rnorm(5, 1.4, 2) , rnorm(6, 1.6, 1))
df = data.frame(sample)

# THERORY RECAP

## STEP BY STEP
N = length(sample)
mu = mean(sample)
std_dev = sd(sample)
std_err = std_dev/sqrt(N)

mu
std_err

## LIBRARY
#install.packages('plotrix')
library(plotrix)

std.error(sample)

# BOOTSTRAP

## STEP BY STEP
n_iter = 1000
means = rep(NULL, n_iter)

for (i in 1:n_iter){
    indexes = as.matrix(sample(1:N), replace=TRUE)
    values = df[indexes]
    means[i] = mean(values)
}

boot_mu = mean(means)
boot_std_err = sqrt((sum(means - boot_mu)^2)/(n_iter-1))

boot_mu
boot_std_err

## LIBRARY

#install.packages('boot')
library(boot)

foo = function(data, indexes) {
    return(mean(data[indexes, ]))
}

results = boot(df, foo, R = n_iter, stype = 'i' )
results

# BLOCK BOOTSTAP?

N = 200
K = 20

beta_A = 0.5
beta_B = 0.5

n_iter = 1000

X = rbeta(N, beta_A, beta_B)

