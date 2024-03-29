% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cor_mat.R
\name{cor_mat}
\alias{cor_mat}
\alias{cor_pmat}
\alias{cor_get_pval}
\title{Compute Correlation Matrix with P-values}
\usage{
cor_mat(
  data,
  ...,
  vars = NULL,
  method = "pearson",
  alternative = "two.sided",
  conf.level = 0.95
)

cor_pmat(
  data,
  ...,
  vars = NULL,
  method = "pearson",
  alternative = "two.sided",
  conf.level = 0.95
)

cor_get_pval(x)
}
\arguments{
\item{data}{a data.frame containing the variables.}

\item{...}{One or more unquoted expressions (or variable names) separated by
commas. Used to select a variable of interest.}

\item{vars}{a character vector containing the variable names of interest.}

\item{method}{a character string indicating which correlation
    coefficient is to be  used for the test.  One of \code{"pearson"},
    \code{"kendall"}, or \code{"spearman"}, can be abbreviated.}

\item{alternative}{indicates the alternative hypothesis and must be
    one of \code{"two.sided"}, \code{"greater"} or \code{"less"}.  You
    can specify just the initial letter.  \code{"greater"} corresponds
    to positive association, \code{"less"} to negative association.}

\item{conf.level}{confidence level for the returned confidence
    interval.  Currently only used for the Pearson product moment
    correlation coefficient if there are at least 4 complete pairs of
    observations.}

\item{x}{an object of class \code{cor_mat}}
}
\value{
a data frame
}
\description{
Compute correlation matrix with p-values. Numeric columns in the
 data are detected and automatically selected for the analysis. You can also
 specify variables of interest to be used in the correlation analysis.
}
\section{Functions}{
\itemize{
\item \code{cor_mat()}: compute correlation matrix with p-values. Returns a data
frame containing the matrix of the correlation coefficients. The output has
an attribute named "pvalue", which contains the matrix of the correlation
test p-values.

\item \code{cor_pmat()}: compute the correlation matrix but returns only the p-values of the tests.

\item \code{cor_get_pval()}: extract a correlation matrix p-values from an object of
class \code{cor_mat()}. P-values are not adjusted.

}}
\examples{
# Data preparation
#:::::::::::::::::::::::::::::::::::::::::::
mydata <- mtcars \%>\%
  select(mpg, disp, hp, drat, wt, qsec)
head(mydata, 3)

# Compute correlation matrix
#::::::::::::::::::::::::::::::::::::::::::
# Correlation matrix between all variables
cor.mat <- mydata \%>\% cor_mat()
cor.mat

# Specify some variables of interest
mydata \%>\% cor_mat(mpg, hp, wt)

# Or remove some variables in the data
# before the analysis
mydata \%>\% cor_mat(-mpg, -hp)

# Significance levels
#::::::::::::::::::::::::::::::::::::::::::
cor.mat \%>\% cor_get_pval()


# Visualize
#::::::::::::::::::::::::::::::::::::::::::
# Insignificant correlations are marked by crosses
cor.mat \%>\%
  cor_reorder() \%>\%
  pull_lower_triangle() \%>\%
  cor_plot(label = TRUE)

# Gather/collapse correlation matrix into long format
#::::::::::::::::::::::::::::::::::::::::::
cor.mat \%>\% cor_gather()


}
\seealso{
\code{\link{cor_test}()}, \code{\link{cor_reorder}()},
 \code{\link{cor_gather}()}, \code{\link{cor_select}()},
 \code{\link{cor_as_symbols}()}, \code{\link{pull_triangle}()},
 \code{\link{replace_triangle}()}
}
