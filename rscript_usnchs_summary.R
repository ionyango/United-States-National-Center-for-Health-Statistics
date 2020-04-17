library(tidyverse)
library (dslabs)
library(dplyr)
library(NHANES)
library(forcats)

#Importing data from the survey collected by the United States National Center for Health Statistics (NCHS)
data ("NHANES")
head(NHANES)

##Mean and Standard deviation of systolic blood pressure for females aged between 20-29
ref1<- NHANES %>% filter(AgeDecade== " 20-29", Gender=="female")%>% summarise(Average=mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))
ref%>% pull(Average)

##Max and Min values of systolic blood pressure for females aged 20-29
descpt<- NHANES %>% filter(AgeDecade== " 20-29", Gender=="female")%>% summarise(minimum = min(BPSysAve, na.rm = TRUE), Maximum = (max(BPSysAve, na.rm = TRUE)))
descpt%>% pull(Maximum)
descpt%>% pull(minimum)

##Mean and Standard deviation of systolic blood pressure for females of different age groups
ref2<- NHANES %>% group_by(fct_explicit_na(AgeDecade)) %>% filter(Gender=="female")%>% summarise(Average=mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))
ref2%>% pull(Average)

##Mean and Standard deviation of systolic blood pressure for males of different age groups
ref3<- NHANES %>% group_by(fct_explicit_na(AgeDecade)) %>% filter(Gender=="male")%>% summarise(Average=mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))
ref3%>% pull(Average)

##Mean and Standard deviation of systolic blood pressure for males and females of different age groups
ref4<- NHANES %>% group_by(fct_explicit_na(AgeDecade), Gender) %>%  summarise(Average=mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))
ref4%>% pull(Average)

##Compare Mean and Standard deviation of systolic blood pressure across race for males of between 40 - 49 yrs
ref5<- NHANES %>% group_by(Race1) %>% filter(AgeDecade == " 40-49", Gender=="male")%>% summarise(Average=mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))
ref5 %>% arrange(Average)








