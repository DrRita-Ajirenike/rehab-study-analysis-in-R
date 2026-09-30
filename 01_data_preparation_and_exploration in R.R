library(readxl)
Rehab_200_1 <- read_excel(r"(C:\Users\HP\Desktop\R Project\Rehab_200_1.xlsx)")
View(Rehab_200_1)

str(Rehab_200_1)

#2. Creating variables 
#The analyses that we want to run require a few variables that are not in the data, therefore they need to be created. 


#a. CREATING VARIABLES --variables TRIG_diff and CHOL_diff

Rehab_200_1$TRIG_DIFF <- Rehab_200_1$TRIGD - Rehab_200_1$TRIGE
Rehab_200_1$CHOL_DIFF <- Rehab_200_1$CHOLD - Rehab_200_1$CHOLE

#b. Converting the variables TREAT, HYPERTEN, and DIAB into factors 

Rehab_200_1$TREAT_factor <- factor(Rehab_200_1$TREAT, levels = c(0,1),
                                   labels = c("standard", "Intensive"))

Rehab_200_1$HYPERTEN_factor <- factor(Rehab_200_1$HYPERTEN, levels = c(0,1),
                                      labels = c("Absent", "Present"))  
Rehab_200_1$DIAB_factor <- factor(Rehab_200_1$DIAB, levels = c(0,1),
                                  labels = c("Absent", "Present"))



#c. Create the variable SALARY_group, with the cut-offs <= 30K, (30K, 40K], > 40K 
#using cut

Rehab_200_1$SALARY_GROUPS <- cut(Rehab_200_1$SALARY,c(0, 30000, 40000, max(Rehab_200_1$SALARY)))
str(Rehab_200_1$SALARY_GROUPS)
levels(Rehab_200_1$SALARY_GROUPS) <- c("< =30K", "30K -40K", ">40K")


#3. Data familiarization--- let's see how the data looks

#BOXPLOT
#a.	Create boxplots to plot TRIG_diff and CHOL_diff split on treatment


boxplot(Rehab_200_1$TRIG_DIFF~ Rehab_200_1$TREAT_factor , main= "TRIG_diff")

boxplot(Rehab_200_1$CHOL_DIFF~ Rehab_200_1$TREAT, main = "CHOL_diff")

#OR PLOT BOXPLOT WITH:

boxplot(CHOL_DIFF ~ TREAT_factor,
        data = Rehab_200_1,
        main = "Change in cholesterol by treatment",
        xlab = "Treatment group",
        ylab = "Cholesterol change")


boxplot(TRIG_DIFF ~ TREAT_factor,
        data = Rehab_200_1,
        main = "Change in triglyceride by treatment",
        xlab = "Treatment group",
        ylab = "Triglyceride change")



#B. summary statistics for HYPERTEN, DIAB and SALARY slit on treatment.


by(Rehab_200_1[c("HYPERTEN_factor", "DIAB_factor", "SALARY_GROUPS")], Rehab_200_1$TREAT_factor , summary)


#C. the number of hypertensive and diabetic subjects in the intensive treatment group?
#ANSWER OF C from B above--- hypertensive= 40 and diabetic= 10



#trying out other columns
summary(Rehab_200_1$HYPERTEN)

summary(Rehab_200_1$HYPERTEN[Rehab_200_1$TREAT_factor == "Intensive"])

summary(Rehab_200_1$HYPERTEN[Rehab_200_1$TREAT_factor =="standard"])

summary(Rehab_200_1$DIAB[Rehab_200_1$TREAT_factor =="standard"])

summary(Rehab_200_1$DIAB[Rehab_200_1$TREAT_factor =="Intensive"])

summary(Rehab_200_1$SALARY[Rehab_200_1$TREAT_factor =="standard"])

summary(Rehab_200_1$SALARY[Rehab_200_1$TREAT_factor =="Intensive"])



#more personal practice
sum(Rehab_200_1$DIAB == "1" & Rehab_200_1$TREAT_factor == "Intensive", na.rm = TRUE)


#D, median salary in the standard treatment group  

by(Rehab_200_1$SALARY, Rehab_200_1$TREAT_factor, summary)
#ANSWER- median salary in std treatment group = 35657

#e.	Use proportional tables to investigate which salary group for which it is most common to be 
#in the intensive treatment group, have hypertension, and have diabetes

prop.table(table(Rehab_200_1$SALARY_GROUPS, Rehab_200_1$TREAT_factor),1)
prop.table(table(Rehab_200_1$SALARY_GROUPS, Rehab_200_1$HYPERTEN_factor),1)
prop.table(table(Rehab_200_1$SALARY_GROUPS, Rehab_200_1$DIAB_factor),1)

