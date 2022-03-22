\name{maxSharpe}
\alias{maxSharpe}
\concept{portfolio selection}
\title{
  Maximum Sharpe-Ratio/Tangency Portfolio
}
\description{
  Compute maximum Sharpe-ratio portfolios, subject to lower and upper bounds
  on weights.
}
\usage{
maxSharpe(var, wmin = 0, wmax = 1, method = "qp",
          groups = NULL, groups.wmin = NULL, groups.wmax = NULL)
}
\arguments{
  \item{var}{
    the covariance matrix: a numeric (real), symmetric matrix
}
  \item{wmin}{
    numeric: a lower bound on weights. May also be a vector that holds
    specific bounds for each asset.
}
\item{wmax}{
      numeric: an upper bound on weights. May also be a vector that holds
    specific bounds for each asset.
}
  \item{method}{
    character. Currently, only \code{"qp"} is supported.
  }
  \item{groups}{
    a list of group definitions
  }
  \item{groups.wmin}{
    a numeric vector
  }
  \item{groups.wmax}{
    a numeric vector
  }
}
\details{

  The function uses \code{\link[quadprog]{solve.QP}} from package
  \pkg{quadprog}. Because of the algorithm that
  \code{\link[quadprog]{solve.QP}} uses, \code{var} has to be positive
  definit (i.e. must be of full rank).

}
\value{
  a numeric vector (the portfolio weights) with an attribute
  \code{variance} (the portfolio's variance)
}
\references{
  Gilli, M., Maringer, D. and Schumann, E. (2019) \emph{Numerical
  Methods and Optimization in Finance}. 2nd edition. Elsevier.
  \url{https://www.elsevier.com/books/numerical-methods-and-optimization-in-finance/gilli/978-0-12-815065-8}

  Schumann, E. (2012) Computing the global minimum-variance
  portfolio. \url{http://enricoschumann.net/R/minvar.htm}

  Schumann, E. (2019) Financial Optimisation with R (\pkg{NMOF} Manual).
  \url{http://enricoschumann.net/NMOF.htm#NMOFmanual}
}
\author{
  Enrico Schumann
}
\seealso{
  \code{\link{TAopt}}
}
\examples{

1+1

}