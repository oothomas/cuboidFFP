####################################
# FORM: Multiple Rate Brownian Motion Models
####################################
# Load Library and Data
library(mvMORPH)
load("Prepped.Data.Form-Shape.Rdata")


####################################
# locomotor regime

####################################
# BMM, constraint = diagonal, indepdent multiple rate BM evolution of traits
# i.e. a different rate for each regime
loc.mvform.BMM.1 <- mvBM(tree = loc.Simmap, data = form.md76,
                         error = me.form.md76, model = "BMM",
                         param = list(constraint = "diagonal", smean = TRUE),
                         method = "rpf", scale.height = FALSE,
                         optimization = "subplex",
                         control = list(maxit = 20000),
                         diagnostic = TRUE, echo = TRUE)

####################################
# BMM, constraint = TRUE, constrained multiple rate BM evolution among traits
# i.e. a different rate for each regime, same variance, different covariances
loc.mvform.BMM.2 <- mvBM(tree = loc.Simmap, data = form.md76,
                         error = me.form.md76, model = "BMM",
                         param = list(constraint = TRUE, smean = TRUE),
                         method = "rpf", scale.height = FALSE,
                         optimization = "subplex",
                         control = list(maxit = 20000),
                         diagnostic = TRUE, echo = TRUE)

####################################
# BMM, constraint = "shared"
loc.mvform.BMM.3 <- mvBM(tree = loc.Simmap, data = form.md76,
                         error = me.form.md76, model = "BMM",
                         param = list(constraint = "shared", smean = TRUE),
                         method = "rpf", scale.height = FALSE,
                         optimization = "subplex",
                         control = list(maxit = 20000),
                         diagnostic = TRUE, echo = TRUE)

####################################
# BMM, constraint = "correlation"
loc.mvform.BMM.4 <- mvBM(tree = loc.Simmap, data = form.md76,
                         error = me.form.md76, model = "BMM",
                         param = list(constraint = "correlation",
                                      smean = TRUE),
                         method = "rpf", scale.height = FALSE,
                         optimization = "subplex",
                         control = list(maxit = 20000),
                         diagnostic = TRUE, echo = TRUE)

####################################
# BMM, constraint = "proportional"
loc.mvform.BMM.5 <- mvBM(tree = loc.Simmap, data = form.md76,
                         error = me.form.md76, model = "BMM",
                         param = list(constraint = "proportional",
                                      smean = TRUE),
                         method = "rpf", scale.height = FALSE,
                         optimization = "subplex",
                         control = list(maxit = 20000),
                         diagnostic = TRUE, echo = TRUE)

####################################
# BMM, constraint = NULL
loc.mvform.BMM.6 <- mvBM(tree = loc.Simmap, data = form.md76,
                         error = me.form.md76, model = "BMM",
                         param = list(smean = TRUE),
                         method = "rpf", scale.height = FALSE,
                         optimization = "subplex",
                         control = list(maxit = 20000),
                         diagnostic = TRUE, echo = TRUE)

loc.mvform.BMM.1$AICc
loc.mvform.BMM.2$AICc
loc.mvform.BMM.3$AICc
loc.mvform.BMM.4$AICc
loc.mvform.BMM.5$AICc
loc.mvform.BMM.6$AICc