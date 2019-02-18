
# Power analysis
# Source Anti-Reliability and Backfire in Political Belief Updating: Proposal for TESS-Special Competition for Young Investigators

# load libraries
library(DeclareDesign)
library(DesignLibrary)
library(knitr)

set.seed(42)

# design specification
mydesign <- pretest_posttest_designer(N = 533, # set sample size (corresponds to approx. N = 267 in each treatment group)
                                      ate = 0.2, # set ATE
                                      sd_1 = 1, # sd in group 1
                                      sd_2 = 1, # sd in group 2
                                      rho = 0.6, # assumed correlation between wave 1 and wave 2 beliefs
                                      attrition_rate = 0) # attrition rate (set to 0 because our sample size specified by N already assumes 20% attrition)

# diagnose the design
mydesignlib <- diagnose_design(mydesign, sims = 500) # note that the default number of sims is 500

# call the diagnosis
kable(data.frame(t(mydesignlib$diagnosands_df)))
# note that the pretest_posttest_designer() function provides diagnosis for three analytic approaches:
# 1: analysis of y1 -> y2 change scores
# 2: analysis of y2 (posttest) scores, adjusting for y1 (pretest) scores (this is the output we focus on in our power analysis)
# 3: analysis of posttest (y2) scores only
