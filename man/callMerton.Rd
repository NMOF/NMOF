\name{callMerton}
\alias{callMerton}
\title{
Price of a European Call under Merton's Jump--Diffusion Model
}
\description{

  Computes the price of a European Call under Merton's jump--diffusion
  model (and the equivalent Black--Scholes--Merton volatility)

}
\usage{
callMerton(S, X, tau, r, q, v, lambda, muJ, vJ, N, implVol = FALSE)
}
\arguments{
  \item{S}{current stock price}
  \item{X}{strike price}
  \item{tau}{time to maturity}
  \item{r}{risk-free rate}
  \item{q}{dividend rate}
  \item{v}{variance}
  \item{lambda}{jump intensity}
  \item{muJ}{mean jump-size}
  \item{vJ}{variance of jump-size}
  \item{N}{The number of jumps.  See Details.}
  \item{implVol}{compute equivalent Black--Scholes--Merton volatility?
                 Default is \code{FALSE}.}
}
\details{

The function computes the value of a plain-vanilla European call under
Merton's jump--diffusion model.  Put values can be computed through
put--call-parity (see \code{\link{putCallParity}}).  If \code{implVol}
is \code{TRUE}, the function also computes the implied volatility
necessary to obtain the same price under Black--Scholes--Merton.  The
implied volatility is computed with \code{\link{uniroot}} from the
\pkg{stats} package.

Note that the function takes variances as inputs (not volatilities).

The number of jumps \code{N} typically can be set 10 or 20. (Just try to
increase \code{N} and see how the results change.)

}
\value{

  Returns the value of the call (numeric) or, if \code{implVol} is
  \code{TRUE}, a list of the value and the implied volatility.

}
\references{
Gilli, M., Maringer, D. and Schumann, E. (2011) \emph{Numerical Methods
  and Optimization in Finance}. Elsevier.
\url{http://www.elsevierdirect.com/product.jsp?isbn=9780123756626}

Merton, R.C. (1976) Option Pricing when Underlying Stock Returns are
Discontinuous. \emph{Journal of Financial Economics} \strong{3}(1--2),
125--144.

}
\author{
Enrico Schumann
}
\seealso{
\code{\link{callCF}}, \code{\link{EuropeanCall}}
}
\examples{
S <- 100; X <- 100; tau <- 1
r <- 0.0075; q <- 0.00
v <- 0.2^2
lambda <- 1; muJ <- -0.2; vJ <- 0.6^2
N <- 20

## jumps can make a difference
callMerton(S, X, tau, r, q, v, lambda, muJ, vJ, N, implVol = TRUE)
callCF(cf = cfMerton, S = S, X = X, tau = tau, r = r, q = q,
       v = v, lambda = lambda, muJ = muJ, vJ = vJ, implVol = TRUE)
vanillaOptionEuropean(S,X,tau,r,q,v, greeks = FALSE)

lambda <- 0 ## no jumps
callMerton(S, X, tau, r, q, v, lambda, muJ, vJ, N, implVol = FALSE)
vanillaOptionEuropean(S,X,tau,r,q,v, greeks = FALSE)

lambda <- 1; muJ <- 0; vJ <- 0.0^2  ## no jumps, either
callMerton(S, X, tau, r, q, v, lambda, muJ, vJ, N, implVol = FALSE)
vanillaOptionEuropean(S,X,tau,r,q,v, greeks = FALSE)

}
