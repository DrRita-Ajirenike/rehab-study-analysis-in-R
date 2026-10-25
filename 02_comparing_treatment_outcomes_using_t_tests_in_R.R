library(readxl)
Rehab_200_1 <- read_excel(r"(C:\Users\HP\Desktop\R Project\Rehab_200_1.xlsx)")
View(Rehab_200_1)

#Comparing Three-Month Changes in Working Capacity and Lipid Levels Between Rehabilitation Treatment Groups.

#RESEARCH QUESTIONS

#1. Is there a difference in the mean change in working capacity from entry to discharge at three months 
#between participants receiving intensive and standard rehabilitation treatment?

#2. Is there a difference in the mean change in cholesterol levels between the two treatment groups over three months?
#3. Is there a difference in the mean change in triglyceride levels between the two treatment groups over three months?


#STEP 1 -- create a new variable --WEFF (this is the difference in working capacity betwwen admission and discgarge at 3 months)

Rehab_200_1$WEFF <- Rehab_200_1$WD - Rehab_200_1$WE

#STEP 2 -- Generate the descriptive statistics of WEFF for both treatment groups.

#-------- first Convert the variables TREAT into factor

Rehab_200_1$TREAT_factor <- factor(Rehab_200_1$TREAT, levels = c(0,1),
                                   labels = c("standard", "Intensive"))

#-----then find the mean for both treatment groups or run a summary stat for both

by(Rehab_200_1$WEFF, Rehab_200_1$TREAT_factor, mean)


#-- Intensive (44.18) vs Standard (35.19) shows that the intensive group had greater change in their work capacity after 3 months


by(Rehab_200_1$WEFF, Rehab_200_1$TREAT_factor, sd)


by(Rehab_200_1$WEFF, Rehab_200_1$TREAT_factor, var)


#RQ 2 --Is there a difference in the mean change in cholesterol levels between the two treatment groups over three months?
Rehab_200_1$TRIG_DIFF <- Rehab_200_1$TRIGD - Rehab_200_1$TRIGE
Rehab_200_1$CHOL_DIFF <- Rehab_200_1$CHOLD - Rehab_200_1$CHOLE

by(Rehab_200_1$CHOL_DIFF, Rehab_200_1$TREAT_factor, mean, na.rm =TRUE)

---- #std(-0.650) vs int(-0.696) - both treatment grps show  a reduction in cholesterol change with the inteb=nsive grp showing more 
  #reduction. This is just descriptive... Let's now check if this difference is statistically significant using t test
  
t.test(Rehab_200_1$CHOL_DIFF ~ Rehab_200_1$TREAT_factor, data = Rehab_200_1)


t.test(Rehab_200_1$CHOL_DIFF ~ Rehab_200_1$TREAT_factor, var.equal = TRUE, conf.level = 0.95)



#RQ 3-- Is there a difference in the mean change in triglyceride levels between the two treatment groups over three months?

Rehab_200_1$TRIG_DIFF <- Rehab_200_1$TRIGD - Rehab_200_1$TRIGE



by(Rehab_200_1$TRIG_DIFF, Rehab_200_1$TREAT_factor, mean, na.rm =TRUE)


t.test(Rehab_200_1$TRIG_DIFF ~ Rehab_200_1$TREAT_factor, data = Rehab_200_1)


t.test(Rehab_200_1$TRIG_DIFF ~ Rehab_200_1$TREAT_factor, var.equal = TRUE, conf.level = 0.95)


#qtn 4-	Which group has the higher spread/variation (standard deviation)? 

by(Rehab_200_1$WEFF, Rehab_200_1$TREAT_factor, var) # Calculate the variance by treatment group

by(Rehab_200_1$WEFF, Rehab_200_1$TREAT_factor, sd) # Calculate standard deviation by treatment group


#5 - Can it be assumed that the variable WEFF is symmetrically distributed in both treatment groups?




# Plot for Standard Treatment

hist(Rehab_200_1$WEFF[Rehab_200_1$TREAT_factor == "standard"], 
     main = "Standard Treatment", 
     xlab = "WEFF Score", 
     col = "yellow")

# Plot for Intensive Treatment

hist(Rehab_200_1$WEFF[Rehab_200_1$TREAT_factor == "Intensive"], 
     main = "Intensive Treatment", 
     xlab = "WEFF Score", 
     col = "blue")
par(mfrow=c(1,1))


#-- Alternatively, estimate of skewness can be used, ---(Q-Q plot is also an alternative)

library(moments)
by(Rehab_200_1$WEFF, Rehab_200_1$TREAT_factor, skewness) # Calculate skewness by treatment group


par(mfrow = c(1, 2))

with(Rehab_200_1, {
  standard <- WEFF[TREAT_factor == "standard"]
  intensive <- WEFF[TREAT_factor == "Intensive"]
  
  qqnorm(standard, main = "Standard treatment")
  qqline(standard, col = "red")
  
  qqnorm(intensive, main = "Intensive treatment")
  qqline(intensive, col = "red")
})

par(mfrow = c(1, 1)) 


# Analysis by inferential statistics 
#Statistical hypothesis testing
#Is WEFF different in the 2 groups, which statistical test can be used to address this and what are the assumptions that needs to
#be met in this statistical test.


#ANSWER----Independent t test will be used
#assumptions -- 1) Independence between groups 2) independence within groups 3) Approximate normality of WEFF in each group 4)Equal variance
#ALL 4 assumptions are met as demonstrated above, so hypothesis testing is next

# the t test will now bE RUN

t.test(Rehab_200_1$WEFF ~ Rehab_200_1$TREAT_factor, var.equal = TRUE, conf.level = 0.95)

