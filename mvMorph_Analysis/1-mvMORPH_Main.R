library(mvMORPH)
library(mvSLOUCH)
library(OUwie)
library(phytools)
library(ouch)
library(ape)
library(geiger)
library(ouch)
library(parallel)

phy76 <- read.nexus("phy76.nex")
env.phy76 <- read.nexus("env.phy76.nex")
l1ou.phy76 <- read.nexus("l1ouPhy76.form.nex")
loc.phy76 <- read.nexus("loc.phy76.nex")

form76 <- read.csv("mvMORPH_7v.csv", row.names = c(1))[,-c(7)]
me.form76 <- ((read.csv("mvMORPH_me._7v.csv", row.names = c(1)))^2)[,-c(7)]

tip.regs <- read.csv("l1ou_env.regs.csv", header = T, row.names = c(1))

load("Final_mvMORPH.Rdata")

env <- as.character(tip.regs$env); names(env) = rownames(tip.regs)
loc <- as.character(tip.regs$loc); names(loc) = rownames(tip.regs)
l1ou <- as.character(tip.regs$l1ou); names(l1ou) = rownames(tip.regs)
env1 <- make.simmap(tree = env.phy76, x = env, model = "ER", nsim = 1)
loc1 <- make.simmap(tree = loc.phy76, x = loc, model = "ER", nsim = 1)
l1ou1 <- make.simmap(tree = l1ou.phy76, x = l1ou, model = "ER", nsim = 1)

plotSimmap(tree = env1, lwd = 2)
plotSimmap(loc1, lwd = 2)
plotSimmap(l1ou1, lwd = 2)

###########################################
# nb_cores=6L
# oum_data1<- mclapply(1:nsim, function(x){
#   mvOU(tree, data1[[x]], model="OUM", method="sparse", diagnostic=F, echo=F) }, mc.cores = getOption("mc.cores", nb_cores))
###########################################

# ###########################################
# #BM1 Form, constraint = "TRUE", covariation between traits considered
# mvform.BM1.1 <- mvBM(tree = phy76, data = form76, error = se.form76,
#                   model = "BM1",
#                   param = list(constraint = "TRUE", smean = TRUE),
#                   method = "rpf", scale.height = FALSE,
#                   optimization = "subplex",
#                   control = list(maxit = 20000000),
#                   diagnostic = TRUE, echo = TRUE)
# 
# #BM1 Form, constraint = "diagnonal", traits evolved independently
# mvform.BM1.2 <- mvBM(tree = phy76, data = form76, error = se.form76,
#                          model = "BM1",
#                          param = list(constraint = "diagonal", smean = TRUE),
#                          method = "rpf", scale.height = FALSE,
#                          optimization = "subplex",
#                          control = list(maxit = 20000000),
#                          diagnostic = TRUE, echo = TRUE)
# 
# #BM1 Form, constraint = NULL, no constraints
# mvform.BM1.3 <- mvBM(tree = phy76, data = form76, error = se.form76,
#                          model = "BM1",
#                          param = list(smean = TRUE),
#                          method = "rpf", scale.height = FALSE,
#                          optimization = "subplex",
#                          control = list(maxit = 20000000),
#                          diagnostic = TRUE, echo = TRUE)
# 
# 
# ###########################################
# #OU1 Form, no constraint
# system.time(mvform.OU1.1 <- mvOU(tree = phy76, data = form76, error = se.form76,
#                                  model = "OU1",
#                                  method = "pseudoinverse", scale.height = FALSE,
#                                  optimization = "subplex",
#                                  control = list(maxit = 20000000),
#                                  diagnostic = TRUE, echo = TRUE))
# beepr::beep(sound = 1)
# #OU1 Form, decomp="nsymmetric", root = TRUE
# system.time(mvform.OU1.2 <- mvOU(tree = phy76, data = form76, error = se.form76,
#                                  model = "OU1",
#                                  param = list(decomp="nsymmetric", root = TRUE, vcv = "mvmorph"),
#                                  method = "pseudoinverse", scale.height = FALSE,
#                                  optimization = "subplex",
#                                  control = list(maxit = 20000000),
#                                  diagnostic = TRUE, echo = TRUE))
# beepr::beep(sound = 1)
# #OU1 Form, decomp="diagonal", root = TRUE
# system.time(mvform.OU1.3 <- mvOU(tree = phy76, data = form76, error = se.form76,
#                                  model = "OU1",
#                                  param = list(decomp="diagonal", root = TRUE, vcv = "mvmorph"),
#                                  method = "pseudoinverse", scale.height = FALSE,
#                                  optimization = "subplex",
#                                  control = list(maxit = 20000000),
#                                  diagnostic = TRUE, echo = TRUE))
# beepr::beep(sound = 1)
# #OU1 Form, vcv = "ouch", decomp="symmetricPositive", root = TRUE
# system.time(mvform.OU1.4 <- mvOU(tree = phy76, data = form76, error = se.form76,
#                                  model = "pseudoinverse",
#                                  param = list(decomp="symmetricPositive",
#                                               root = TRUE, vcv = "ouch"),
#                                  method = "pseudoinverse", scale.height = FALSE,
#                                  optimization = "subplex",
#                                  control = list(maxit = 20000000),
#                                  diagnostic = TRUE, echo = TRUE))
# beepr::beep(sound = 1)


l1ou.OUM <- mvOU(tree = l1ou, data = form76, error = me.form76, model = "OUM",
                 method = "sparse", scale.height = TRUE, optimization = "subplex",
                 control = list(maxit = 2000000), diagnostic = TRUE, echo = TRUE)

env.OUM <- mvOU(tree = env, data = form76, error = me.form76, model = "OUM",
                 method = "sparse", scale.height = TRUE, optimization = "subplex",
                 control = list(maxit = 2000000), diagnostic = TRUE, echo = TRUE)

loc.OUM <- mvOU(tree = loc, data = form76, error = me.form76, model = "OUM",
                 method = "sparse", scale.height = TRUE, optimization = "subplex",
                 control = list(maxit = 2000000), diagnostic = TRUE, echo = TRUE)