####################################
# FORM: Single Rate Brownian Motion Models
####################################
# Load Library and Data
library(mvMORPH)
load("Prepped.Data.Form-Shape.Rdata")

####################################
# BM1, Constraint = diagonal, Independent evolution
# mvform.BM1.1 <- mvBM(tree = phy76, data = form.md76,
#                      error = me.form.md76, model = "BM1",
#                      param = list(constraint = "diagonal", smean = TRUE),
#                      method = "rpf", scale.height = FALSE,
#                      optimization = "subplex",
#                      control = list(maxit = 20000),
#                      diagnostic = TRUE, echo = TRUE)

####################################
# BM1, Constraint = TRUE, covariance taken into account
# mvform.BM1.2 <- mvBM(tree = phy76, data = form.md76,
#                      error = me.form.md76, model = "BM1",
#                      param = list(constraint = TRUE, smean = TRUE),
#                      method = "rpf", scale.height = FALSE,
#                      optimization = "subplex",
#                      control = list(maxit = 20000),
#                      diagnostic = TRUE, echo = TRUE)

####################################
# BM1, Constraint = NULL, no constraint at all
mvform.BM1.3 <- mvBM(tree = phy76, data = form.md76,
                     error = me.form.md76, model = "BM1",
                     param = list(smean = TRUE),
                     method = "rpf", scale.height = FALSE,
                     optimization = "subplex",
                     control = list(maxit = 20000),
                     diagnostic = TRUE, echo = TRUE)
# mvform.BM1.1$AICc
# mvform.BM1.1$AICc
# mvform.BM1.3$AICc
#The Unconstrained BM1 model performs best