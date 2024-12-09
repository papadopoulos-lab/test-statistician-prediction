library(data.table)
library(magrittr)

set.seed(4)
num_people <- 1000
num_variables <- 2000

X <- matrix(rnorm(num_people*num_variables), num_people, num_variables)
log_odds <- log(2)*X[,1] + log(3)*X[,2] + log(4)*X[,3] + rnorm(num_people, mean = -3)

probs <- exp(log_odds) / (1 + exp(log_odds))
Y <- rbinom(num_people, size = 1, prob = probs)

d <- data.table(cbind(Y, X))
setnames(
  d,
  c("Outcome", paste0("Exposure_", 1:num_variables))
)

writexl::write_xlsx(d, "data_raw/data.xlsx")
