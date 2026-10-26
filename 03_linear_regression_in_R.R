library(readxl)
Rehab_200_1 <- read_excel(r"(C:\Users\HP\Desktop\R Project\Rehab_200_1.xlsx)")
View(Rehab_200_1)

#RQ 1 -- What is the association between age and change in work capacity from baseline to three months? (model - simple linear regression)


model_1 <-lm(WEFF~AGE,data=Rehab_200_1)
summary(model_1)

#RQ 2 -- Is treatment allocation associated with change in work capacity after adjusting for age, smoking status, and beta-blocker use? (model - multiple linear regression)

#multiple linear regression -WEEF,AGE, SMOKING STATUS, BETA BLOCKER USE

rehab_fit <- lm(WEFF~TREAT + AGE + SMOKE + B_BLOCK, data = Rehab_200_1)
summary(rehab_fit)


#RQ 3 --Is treatment allocation associated with work capacity at three months after adjusting for baseline work capacity, age, smoking status, and beta-blocker use? (model - Multiple linear regression with baseline adjustment)

#multiple linear regression for treatment, age, smoking status, beta blocker use and work efficiency at baseline (WE) as predictors and work capacity at 3 months (WD) as outcome

rehab_fit_2 <- lm(WD~TREAT+AGE+SMOKE+B_BLOCK+WE, data = Rehab_200_1)
summary(rehab_fit_2)