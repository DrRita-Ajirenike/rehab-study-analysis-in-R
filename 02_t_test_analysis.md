
## Part 2: Comparing Treatment Outcomes Using t-Tests


### Research questions

1. Does mean improvement in working capacity (WEFF) differ between the standard and intensive treatment groups?
2. Does mean cholesterol change differ between the groups after three months?
3. Does mean triglyceride change differ between the groups after three months?

### RQ1: Comparing improvement in working capacity

I calculated WEFF as working capacity at discharge (three months) minus working capacity at admission. A positive value indicates improvement.

I then converted `TREAT` into a factor and calculated mean WEFF for each treatment group.


> by(Rehab_200_1$WEFF, Rehab_200_1$TREAT_factor, mean)
Rehab_200_1$TREAT_factor: standard
[1] 35.18681
---------------------------------------------------------------------------------------------- 
Rehab_200_1$TREAT_factor: Intensive
[1] 44.18349
> 


Mean WEFF was 35.19 in the standard group and 44.18 in the intensive group. The intensive group therefore showed approximately 9 points greater mean improvement in working capacity.

The statistical comparison is presented below, after checking the assumptions.

### RQ2: Comparing cholesterol change

I calculated `CHOL_DIFF` as cholesterol at three months minus cholesterol at admission, then calculated the mean change for each group.

> by(Rehab_200_1$CHOL_DIFF, Rehab_200_1$TREAT_factor, mean, na.rm =TRUE)
Rehab_200_1$TREAT_factor: standard
[1] -0.6505618
---------------------------------------------------------------------------------------------- 
Rehab_200_1$TREAT_factor: Intensive
[1] -0.6962617
>


Mean cholesterol change was −0.651 in the standard group and −0.696 in the intensive group. Both negative values indicate an average reduction, with a slightly larger reduction in the intensive group.

The argument `na.rm = TRUE` excludes missing values when calculating the means. These descriptive results alone do not establish whether the groups differ statistically.

#### Statistical comparison

I used Welch’s independent-samples t-test to compare mean cholesterol change between groups.



 t.test(Rehab_200_1$CHOL_DIFF ~ Rehab_200_1$TREAT_factor, data = Rehab_200_1)

	Welch Two Sample t-test

data:  Rehab_200_1$CHOL_DIFF by Rehab_200_1$TREAT_factor
t = 0.30436, df = 180.47, p-value = 0.7612
alternative hypothesis: true difference in means between group standard and group Intensive is not equal to 0
95 percent confidence interval:
 -0.2505737  0.3419735
sample estimates:
 mean in group standard mean in group Intensive 
             -0.6505618              -0.6962617 




The estimated mean difference (standard minus intensive) was 0.046 units, with a 95% confidence interval of −0.251 to 0.342.

There was no statistically significant difference between groups: t(180.47) = 0.304, p = 0.761.

Because the 95% confidence interval includes zero, the result is not statistically significant at the 5% level. This does not prove that the group means are equal; the analysis did not detect a difference.

### RQ3: Comparing triglyceride change

I calculated `TRIG_DIFF` as triglycerides at three months minus triglycerides at admission, then calculated the mean change for each group.


> by(Rehab_200_1$TRIG_DIFF, Rehab_200_1$TREAT_factor, mean, na.rm =TRUE)
Rehab_200_1$TREAT_factor: standard
[1] -0.3269663
---------------------------------------------------------------------------------------------- 
Rehab_200_1$TREAT_factor: Intensive
[1] -0.3485981



Mean triglyceride change was −0.327 in the standard group and −0.349 in the intensive group. Both groups showed an average reduction, with a slightly larger reduction in the intensive group.

#### Statistical comparison

I used Welch’s independent-samples t-test to compare mean triglyceride change between groups.



> t.test(Rehab_200_1$TRIG_DIFF ~ Rehab_200_1$TREAT_factor, data = Rehab_200_1)

	Welch Two Sample t-test

data:  Rehab_200_1$TRIG_DIFF by Rehab_200_1$TREAT_factor
t = 0.1846, df = 172.28, p-value = 0.8538
alternative hypothesis: true difference in means between group standard and group Intensive is not equal to 0
95 percent confidence interval:
 -0.2096667  0.2529304
sample estimates:
 mean in group standard mean in group Intensive 
             -0.3269663              -0.3485981 




The estimated mean difference (standard minus intensive) was 0.022 units, with a 95% confidence interval of −0.210 to 0.253.

There was no statistically significant difference between groups: t(172.28) = 0.185, p = 0.854.

The confidence interval includes zero. This indicates insufficient evidence of a difference, rather than proof that the treatments have equivalent effects.

### Checking the assumptions for the WEFF comparison

#### Variability within each group

> by(Rehab_200_1$WEFF, Rehab_200_1$TREAT_factor, var) # Calculate the variance by treatment group
Rehab_200_1$TREAT_factor: standard
[1] 363.1758
---------------------------------------------------------------------------------------------- 
Rehab_200_1$TREAT_factor: Intensive
[1] 514.7253
> 
> by(Rehab_200_1$WEFF, Rehab_200_1$TREAT_factor, sd) # Calculate standard deviation by treatment group
Rehab_200_1$TREAT_factor: standard
[1] 19.05717
---------------------------------------------------------------------------------------------- 
Rehab_200_1$TREAT_factor: Intensive
[1] 22.68756


The intensive group had a higher variance (514.73 versus 363.18) and standard deviation (22.69 versus 19.06). This means individual WEFF scores were more spread out around their mean in the intensive group.

As a rough guideline, variability is considered reasonably similar when the larger SD is less than twice the smaller SD, or the larger variance is less than four times the smaller variance.

The SD ratio was approximately 1.19 and the variance ratio was 1.42. These meet the guideline, supporting the equal-variance assumption for this exercise, although they do not prove equal population variances.

Similar variability does not mean that the group means are equal.

#### Histograms

I examined the distribution of WEFF separately in each treatment group.

 # Plot for Standard Treatment
> 
> hist(Rehab_200_1$WEFF[Rehab_200_1$TREAT_factor == "standard"], 
+      main = "Standard Treatment", 
+      xlab = "WEFF Score", 
+      col = "yellow")
> 
> # Plot for Intensive Treatment
> 
> hist(Rehab_200_1$WEFF[Rehab_200_1$TREAT_factor == "Intensive"], 
+      main = "Intensive Treatment", 
+      xlab = "WEFF Score", 
+      col = "blue")
> par(mfrow=c(1,1))


**OUTPUT - HISTOGRAGM**

<img width="543" height="508" alt="Hist plots" src="https://github.com/user-attachments/assets/455eeaa5-157d-4ea6-ac3c-427105c45ed1" />


The histograms suggested broadly bell-shaped distributions, with no obvious severe departure from normality.

#### Skewness

I also calculated skewness for each group.

> library(moments)
> by(Rehab_200_1$WEFF, Rehab_200_1$TREAT_factor, skewness) # Calculate skewness by treatment group
Rehab_200_1$TREAT_factor: standard
[1] -0.1788601
---------------------------------------------------------------------------------------------- 
Rehab_200_1$TREAT_factor: Intensive
[1] 0.2073324
> 

Skewness was −0.179 in the standard group and 0.207 in the intensive group. Both values are close to zero and fall between −1 and +1, suggesting approximately symmetrical distributions.

Skewness supports the assessment of symmetry but does not establish normality on its own.

#### Q–Q plots

I used Q–Q plots to compare each group’s WEFF distribution with a normal distribution.


 #---(Q-Q plot is also an alternative)
> par(mfrow = c(1, 2))
> 
> with(Rehab_200_1, {
+   standard <- WEFF[TREAT_factor == "standard"]
+   intensive <- WEFF[TREAT_factor == "Intensive"]
+   
+   qqnorm(standard, main = "Standard treatment")
+   qqline(standard, col = "red")
+   
+   qqnorm(intensive, main = "Intensive treatment")
+   qqline(intensive, col = "red")
+ })
> 
> par(mfrow = c(1, 1))


**OUTPUT -   Q-Q PLOT**

<img width="543" height="508" alt="Q-Q PLOTS" src="https://github.com/user-attachments/assets/de102be2-3cf9-41ac-a71e-d2393868d510" />







Most points followed the reference lines, with minor deviations at the tails. This supported approximate normality in both groups.

### Inferential analysis of WEFF

#### Hypotheses

- **Null hypothesis:** The population mean change in working capacity is equal in the two treatment groups.
- **Alternative hypothesis:** The population mean change in working capacity differs between the groups.

#### Test and assumptions

I used a two-sided independent-samples Student’s t-test with a 95% confidence interval, assuming equal population variances.

The assumptions considered were:

- **Independent observations:** Each participant belongs to one treatment group and contributes one WEFF change score. Independence must be justified from the study design.
- **Approximate normality:** Histograms, skewness estimates and Q–Q plots supported approximate normality within both groups.
- **No problematic extreme outliers:** These should be checked using the data and boxplots.
- **Equal population variances:** The observed SD and variance ratios supported treating the spreads as reasonably similar for this exercise.

The distributional checks supported using the test, provided independence holds and there are no problematic extreme outliers.

#### Results and interpretation

t.test(Rehab_200_1$WEFF ~ Rehab_200_1$TREAT_factor, var.equal = TRUE, conf.level = 0.95)

	Two Sample t-test

data:  Rehab_200_1$WEFF by Rehab_200_1$TREAT_factor
t = -3.0006, df = 198, p-value = 0.003041
alternative hypothesis: true difference in means between group standard and group Intensive is not equal to 0
95 percent confidence interval:
 -14.90931  -3.08404
sample estimates:
 mean in group standard mean in group Intensive 
               35.18681                44.18349 


Mean WEFF was 44.18 in the intensive group and 35.19 in the standard group, a difference of approximately 9 points.

Student’s independent-samples t-test found a statistically significant difference: t(198) = −3.00, p = 0.003.

The 95% confidence interval for standard minus intensive was −14.91 to −3.08. Expressed as intensive minus standard, the intensive group had an estimated 9.00-point greater mean improvement (95% CI: 3.08 to 14.91).

Because the confidence interval excludes zero, the difference is statistically significant at the 5% level, consistent with the p-value.

### What I learned

- Means describe average outcomes; SDs and variances describe spread within groups.
- Welch’s t-test does not require equal population variances and is the default in R.
- Student’s pooled t-test assumes equal population variances.
- A 95% confidence interval excluding zero corresponds to statistical significance at the 5% level for these two-sided tests.
- A non-significant result does not establish equality or equivalence.
- Statistical significance does not automatically establish clinical importance.
- [Read the regression report](03_regression_analysis.md)
