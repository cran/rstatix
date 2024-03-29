% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binom_test.R
\name{binom_test}
\alias{binom_test}
\alias{pairwise_binom_test}
\alias{pairwise_binom_test_against_p}
\title{Exact Binomial Test}
\usage{
binom_test(
  x,
  n,
  p = 0.5,
  alternative = "two.sided",
  conf.level = 0.95,
  detailed = FALSE
)

pairwise_binom_test(
  x,
  p.adjust.method = "holm",
  alternative = "two.sided",
  conf.level = 0.95
)

pairwise_binom_test_against_p(
  x,
  p = rep(1/length(x), length(x)),
  p.adjust.method = "holm",
  alternative = "two.sided",
  conf.level = 0.95
)
}
\arguments{
\item{x}{numeric vector containing the counts.}

\item{n}{number of trials; ignored if \code{x} has length 2.}

\item{p}{a vector of probabilities of success. The length of p must be the
same as the number of groups specified by x, and its elements must be
greater than 0 and less than 1.}

\item{alternative}{indicates the alternative hypothesis and must be
    one of \code{"two.sided"}, \code{"greater"} or \code{"less"}.
    You can specify just the initial letter.}

\item{conf.level}{confidence level for the returned confidence
    interval.}

\item{detailed}{logical value. Default is FALSE. If TRUE, a detailed result is
shown.}

\item{p.adjust.method}{method to adjust p values for multiple comparisons.
Used when pairwise comparisons are performed. Allowed values include "holm",
"hochberg", "hommel", "bonferroni", "BH", "BY", "fdr", "none". If you don't
want to adjust the p value (not recommended), use p.adjust.method = "none".}
}
\value{
return a data frame containing the p-value and its significance. with
 some the following columns: \itemize{ \item \code{group, group1, group2}:
 the categories or groups being compared. \item \code{statistic}: the number
 of successes. \item \code{parameter}: the number of trials. \item \code{p}:
 p-value of the test. \item \code{p.adj}: the adjusted p-value. \item
 \code{method}: the used statistical test. \item \code{p.signif,
 p.adj.signif}: the significance level of p-values and adjusted p-values,
 respectively. \item \code{estimate}: the estimated probability of success.
 \item \code{alternative}: a character string describing the alternative
 hypothesis. \item \code{conf.low,conf.high}: Lower and upper bound on a
 confidence interval  for the probability of success.}

 The \strong{returned object has an attribute called args}, which is a list
 holding the test arguments.
}
\description{
Performs exact binomial test and pairwise comparisons following a
 significant exact multinomial test. Wrapper around the R base function
 \code{link[stats]{binom.test}()} that returns a data frame as a result.
}
\section{Functions}{
\itemize{
\item \code{binom_test()}: performs exact binomial test. Wrapper around the R
base function \code{\link[stats]{binom.test}} that returns a dataframe as a
result.

\item \code{pairwise_binom_test()}: performs pairwise comparisons (binomial test)
following a significant exact multinomial test.

\item \code{pairwise_binom_test_against_p()}: performs pairwise comparisons (binomial test)
following a significant exact multinomial test for given probabilities.

}}
\examples{
# Exact binomial test
#\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
# Data: 160 mice with cancer including 95 male and 65 female
# Q1: Does cancer affect more males than females?
binom_test(x = 95, n = 160)
# => yes, there are a significant difference


# Q2: compare the observed proportion of males
# to an expected proportion (p = 3/5)
binom_test(x = 95, n = 160, p = 3/5)
# => there are no significant difference

# Multinomial test
#\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%\%
# Data
tulip <- c(red = 81, yellow = 50, white = 27)
# Question 1: are the color equally common ?
# this is a test of homogeneity
res <- multinom_test(tulip)
res
attr(res, "descriptives")

# Pairwise comparisons between groups
pairwise_binom_test(tulip, p.adjust.method = "bonferroni")


# Question 2: comparing observed to expected proportions
# this is a goodness-of-fit test
expected.p <- c(red = 0.5, yellow = 0.33, white = 0.17)
res <- multinom_test(tulip, expected.p)
res
attr(res, "descriptives")

# Pairwise comparisons against a given probabilities
pairwise_binom_test_against_p(tulip, expected.p)
}
\seealso{
\link{multinom_test}
}
