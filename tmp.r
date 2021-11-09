```{r}
rmarkdown::render("manzi/assone.rmd", "html_document")
print('hola')

install.packages("knitr")
install.packages("rmarkdown")
install.packages('mosaicCalc')
install.packages('stats')
install.packages('mosaic')
install.packages('Ryacas')
```

# Part A
```{r}
library(Ryacas)
library(mosaic)
library(stats)
library(mosaicCalc)
```

## Check whether it is a proper CDF using the limit properties only.

```{r}
F = function(x) (1 - (1/exp((x^2)/8)))
```

```{r}
x = ysym("x")
lim(F(x), x, +Inf)
```

## Plot it
```{r}
F_mos = makeFun(F(x) ~ x)
plotFun( F_mos(x) ~ x, xlim = c(0, 10) )

```

## plot its density for X > 0

```{r}
f = function(x) {}
body(f) = D(body(F), 'x')
curve(f, 0, 10, ylab = "PDF(x)")
```


## compute P(0 < X ≤ 2.3)
```{r}
F(2.3) - F(0)
```

## compute E(X)
```{r}
M = antiD((1-F(x)) ~ x)
mu = M(+Inf) - M(0)
mu
```

## compute VAR(X)

```{r}

```

Hints:  for (i) you might use the Ryacas R library;  for (ii) you might use the makeFun() function in the mosaic R package (for piecewise functions) and the curve() R function; for(iii) you might use the D()function in the stats library

## compute the median
```{r}

```

# Part B
Consider theCustomerCare.csvdata set on rating about a new product (columnsRatingpriceandRatingquality).  After considering the variableEducationas group variable

## Perform a MANOVA test to determine if there are differences in the mean vectors ofthe ratings in the education level groups
```{r}
```

## Perform univariate ANOVA tests on each variable
```{r}
```

## Compare and comment on results
```{r}
```

Hints: for (i) you might use themanova Rfunction; for (ii) you might use theaov()function

# Part C
```{r}
```

Consider theCustomerCare.csvdata set on rating about a new product (columnRatingprice)

## Implement the classical bootstrap to estimate the (95%) confidence intervals of the population Pearson’s correlation coefficient between rating andAge
```{r}
```


## Compare with the Fisher transform method
```{r}
```

## Compare with the Fisher transform method
```{r}
```

## Implement an iterative procedure and a package procedure (for exampleusingboot)

## Plot the confidence intervals to visually compare the results

Let Y be the Rating price and X the Age

## Compute the (95%) boostrap confidence interval for Y/X

## Comment on results.

NOTE: This part is similar to an example given in a previous class and should be intendedas an exercise in which you can freely add extra material on bootstrap. For example, you may extend that example including the use of other bootstrap R packages you may find.