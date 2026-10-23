#install.packages("tidyverse")
#install.packages("haven")
library(tidyverse)
library(haven)
library(psych) # desc stats using describe()
library(janitor) # tabulations using tabyl()
theme_set(theme_bw())
options(scipen = 999)
# H0: mu = 40
# Ha: mu != 40
data <- read_rds("ESS7e02_1_v2.rds")
head(data)
# A tibble: 6 × 33
  name   essround country  gender  wkhct      wkhtotp  eduyrs  wkdcorga  wkhtot
  <chr>     <dbl>  <chr>   <fct>  <dbl+lbl>   <dbl+l>  <dbl+> <dbl+lb>  <dbl+lbl>
1 ESS7e02_1   7     BE     Female    30         40      17      9 [9]     30
2 ESS7e02_1   7     BE     Female    666 [Not … 72      14      66 [Not…  666 [Not…
3 ESS7e02_1   7     BE     Female    34         50      14      7 [7]     34 
4 ESS7e02_1   7     BE     Female    2          90      15      0 [I h…   2
5 ESS7e02_1   7     BE     Male      40         32      16      4 [4]     45 
6 ESS7e02_1   7     BE     Female    32         40      12      9 [9]     32
# ℹ 24 more variables: trstprl <dbl+lbl>, trstun <dbl+lbl>, wrkprty <fct>,
# vote <fct>, edition <chr>, proddate <chr>, idno <dbl>, tvtot <dbl+lbl>,
# tvpol <dbl+lbl>, ppltrst <dbl+lbl>, pplfair <dbl+lbl>, pplhlp <dbl+lbl>,
# polintr <dbl+lbl>, psppsgv <dbl+lbl>, actrolg <dbl+lbl>, psppipl <dbl+lbl>,
# cptppol <dbl+lbl>, ptcpplt <dbl+lbl>, etapapl <dbl+lbl>, trstlgl <dbl+lbl>,
# trstplc <dbl+lbl>, gender_num <dbl+lbl>, wrkprty_num <dbl+lbl>,
# vote_num <dbl+lbl>
#View(data)
library(tidyverse) # 或 librar  y(readr)
data <- read_rds("ESS7e02_1_v2.rds")
head(data) # 
library(janitor)
# data %>% tabyl(wkhtotp) %>% adorn_totals()
# hist(data$wkhtotp)
ggplot(data, aes(x = country, y = wkhtotp)) +
  geom_boxplot() +
  scale_y_continuous(limits=c(30, 80))
describe(data$wkhtotp, fast = T)
sweden <- data %>% filter(country == "SE")
describe(sweden$wkhtotp, fast = T)             
t.test(sweden$wkhtotp, mu = 40)