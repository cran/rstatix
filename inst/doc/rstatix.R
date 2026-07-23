## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE
)
options(digits = 3)

## -----------------------------------------------------------------------------
library(rstatix)
library(dplyr)

## -----------------------------------------------------------------------------
df <- ToothGrowth
df$dose <- factor(df$dose)
head(df)

## -----------------------------------------------------------------------------
df %>%
  group_by(dose) %>%
  get_summary_stats(len, type = "mean_sd")

## -----------------------------------------------------------------------------
df %>% check_test_assumptions(len ~ dose)

## -----------------------------------------------------------------------------
df %>% anova_test(len ~ dose, effect.size = "pes", ci = 0.95)

## -----------------------------------------------------------------------------
df %>% posthoc_test(len ~ dose)

## -----------------------------------------------------------------------------
df %>% cohens_d(len ~ dose)

## -----------------------------------------------------------------------------
model <- df %>% anova_test(len ~ dose, effect.size = "pes", ci = 0.95)
get_test_label(model, type = "text", style = "apa")

## -----------------------------------------------------------------------------
df %>% anova_test(len ~ dose) %>% tidy()
df %>% anova_test(len ~ dose) %>% glance()

## -----------------------------------------------------------------------------
df %>%
  group_by(dose) %>%
  t_test(len ~ supp) %>%
  adjust_pvalue(method = "holm") %>%
  add_significance()

## -----------------------------------------------------------------------------
sessionInfo()

