# Part 3: Linear Regression Analysis of Work Capacity Following Rehabilitation.

This analysis examines the relationship between age, treatment allocation, smoking status, beta-blocker use, and work capacity following rehabilitation. Simple and multiple linear regression models are used to investigate changes in work capacity and work capacity at three months, including adjustment for baseline work capacity.

## RESEARCH QUESTIONS
1. What is the association between age and change in work capacity from baseline to three months? (model - simple linear regression)
2. Is treatment allocation associated with change in work capacity after adjusting for age, smoking status, and beta-blocker use? (model - multiple linear regression)
3. Is treatment allocation associated with work capacity at three months after adjusting for baseline work capacity, age, smoking status, and beta-blocker use? (model - Multiple linear regression with baseline adjustment)


<img width="618" height="437" alt="Variables" src="https://github.com/user-attachments/assets/f8fed331-dfee-4f7a-b71e-5cd948814484" />
<img width="867" height="457" alt="Linear regression RQ 1- Age" src="https://github.com/user-attachments/assets/abd556cd-2b6d-4f5e-8c2a-4ad9efe672dd" />



## RQ 1 – Association between age and change in work capacity (WEFF)


![Uploading Linear regression RQ 1- Age.png…]()



<img width="748" height="232" alt="Linear reg rq 1 table 1" src="https://github.com/user-attachments/assets/d470771f-0169-488e-995d-9cc69415ac87" />



## Interpretation
Each additional year of age was associated with approximately 2 units less improvement in work capacity (β = −2.00, p < 0.001). 
The model’s R² was 0.412 (41.2%), meaning that age explained approximately 41% of the observed variation in change in work capacity among patients in this sample. The remaining approximately 59% was not explained by this age-only model.
To interpret R², multiply it by 100: this gives the percentage of variation in the outcome explained by the model.
Answer to the research question 1: Older age was associated with less improvement in work capacity, with approximately 2 units less improvement for each additional year of age (β = −2.00, p < 0.001). 

## RQ 2 - Association of treatment allocation with change in work capacity after adjusting for age, smoking status, and beta-blocker use.


<img width="887" height="505" alt="Linear reg  RQ 2" src="https://github.com/user-attachments/assets/4e6450e5-6481-4006-88db-f6f527dba830" />


<img width="748" height="363" alt="lin reg RQ2 - table 2" src="https://github.com/user-attachments/assets/14fb41b7-3d45-4ac4-b56a-72e43bab886d" />




## Interpretation of findings
Each coefficient describes the association with change in work capacity (WEFF) while holding the other variables in the model constant. 
Treatment: Patients receiving intensive treatment had, on average, 3.50 units greater improvement than those receiving standard treatment. However, the evidence for a difference was not statistically significant 5% significance level (p = 0.142). 
Age: Each additional year of age was associated with 2.18 units less improvement in work capacity (p < 0.001).
Smoking: Smokers had, on average, 5.82 units greater improvement than non-smokers (p = 0.046). This association does not establish that smoking benefits recovery.
Beta-blocker use: Patients taking beta-blockers had, on average, 11.32 units less improvement than those not taking them (p < 0.001). This association does not establish that beta-blockers caused poorer recovery.

##What does R² mean?
The model’s R² = 0.4933. This means that treatment, age, smoking status, and beta-blocker use together explained approximately 49.3% of the observed variation in change in work capacity. The remaining 50.7% was not explained by this model.

## What does adjusted R² mean?
The adjusted R² = 0.4829 (48.3%). This accounts for the number of predictors relative to the sample size.
Answer to research question 2: After adjustment for age, smoking status, and beta-blocker use, intensive treatment was associated with greater improvement, but the evidence was insufficient to conclude that the treatment groups differed.

## RQ 3 – Association of work capacity at 3 months with treatment allocation, baseline work capacity, age, smoking status, and beta-blocker use


<img width="1055" height="525" alt="RQ 3 code output" src="https://github.com/user-attachments/assets/9f1509cb-37c6-461b-b50d-ea8e7d7fa2db" />


<img width="751" height="442" alt="RQ 3 table 3" src="https://github.com/user-attachments/assets/a5449e9e-cd5e-4f6e-9ff6-3b71dc5d2bea" />


## Interpretation of findings
Each coefficient represented in the table shows an association with work capacity at three months, holding the other predictors constant. Each additional unit of baseline work capacity was associated with 1.02 units higher work capacity at three months, while each additional year of age was associated with 2.16 units lower work capacity.
Intensive treatment was associated with 3.50 units higher work capacity, but this difference was not statistically significant (p = 0.143). Smokers had 6.02 units higher work capacity, and beta-blocker users had 11.29 units lower work capacity than those who were not on beta-blockers. These associations do not establish causation.

The R² of 0.8598 means that the predictors together explained approximately 86.0% of the observed variation in work capacity at three months.

## Answer to RQ3: After adjustment for baseline work capacity, age, smoking status, and beta-blocker use, there was insufficient evidence of a difference in work capacity at three months between the treatment groups (p = 0.143).


