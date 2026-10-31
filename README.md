# Learn R with Me: Rehabilitation Study Analysis

## About This Project

I am a medical doctor and MSc Global Health student developing my skills in R for health data analysis.

In this project, I revisit a rehabilitation study dataset containing 200 participants in standard and intensive treatment groups. Through this “Learn R with Me” series, I share my code, explain my approach, and reflect on what I learn along the way.

The project began as a quantitative methods course and this repository presents my individual R code, subsequent revisions, and my reflections.

## Part 1: Data Preparation and Exploration

Before comparing treatment outcomes, I prepare the data and explore participant characteristics

In this first part, I practised how to:

- Import an Excel dataset and inspect its structure.
- Calculate changes in cholesterol and triglyceride levels as discharge minus entry values.
- Convert treatment, hypertension, and diabetes variables into labelled factors.
- Group salary into three categories: ≤30,000, >30,000 to ≤40,000, and >40,000.
- Explore changes in cholesterol and triglycerides using boxplots.
- Summarise participant characteristics by treatment group.
- Calculate and interpret proportions within salary groups.


## Step 1: Import and inspect the dataset
I imported the Excel dataset using read_excel() and inspected it using View() and str().

This allowed me to identify the available variables, their storage types, and whether any variables need to be transformed before analysis.

## Step 2: Calculation of changes in lipid levels (Cholesterol & triglyceride)
I created two variables representing changes from entry to discharge:

New variable	Calculation	Meaning
CHOL_DIFF	CHOLD − CHOLE	Change in cholesterol
TRIG_DIFF	TRIGD − TRIGE	Change in triglycerides


How to interpret: Because change is calculated as value at discharge minus value at entry, a negative value indicates a reduction, a positive value indicates an increase, and zero reflects no change.

These variables will be used for subsequent analyses to compare changes between the treatment groups (standard vs treatment).

## Step 3: Creating labelled categorical variables
The original treatment, hypertension, and diabetes variables use numerical codes (0 & 1). I create labelled factors and labeled them accordingly. This makes the variables easier to interpret.
New factor	Original coding	Labels
TREAT_factor	0 / 1	Standard / Intensive
HYPERTEN_factor	0 / 1	Absent / Present
DIAB_factor	0 / 1	Absent / Present


The Factor function tells R that these values represent categories. This is useful when presenting frequency summaries, comparing groups, and fitting models with categorical predictors.

## Step 4: Grouping participants by salary
I created SALARY_GROUPS using three salary bands: ≤30k, 30k to ≤40k and >40k
Descriptive comparisons of treatment allocation, hypertension, and diabetes can be achieved using the salary groupings created.


## Step 5: Exploring lipid changes by treatment group (initial exploration with boxplots)

Guiding question: How do the distributions of cholesterol and triglyceride changes compare between the standard and intensive treatment groups?

I created boxplots of CHOL_DIFF and TRIG_DIFF by the treatment groups (standard vs treatment) and examined the following:

1. The median change in each group.
2. The spread of the observations.
3. Differences in the shapes of the distributions.
4. Potential outlying observations.
These plots provide an initial visual comparison. They do not, by themselves, establish whether the treatment groups differ statistically.

## Step 6: Summarising the participant characteristics by treatment group (standard vs treatment)
Question in mind: How are hypertension, diabetes, and salary distributed across the 2 treatment groups?

I used grouped summaries to describe the frequency of hypertension and diabetes and the distribution of salary categories within each treatment group.

I also examined two specific questions:
1. How many participants in the intensive treatment group have hypertension, and how many have diabetes?
2. What is the median salary among participants in the standard treatment group?
   
Note-- The hypertension and diabetes counts are calculated separately; participants may have both conditions.


## Step 7: Comparing proportions within salary groups
Guiding questions:
1. Which salary group has the highest proportion of participants receiving intensive treatment?
2. Which salary group has the highest proportion of participants with hypertension?
3. Which salary group has the highest proportion of participants with diabetes?



### Selected Descriptive Findings

| Characteristic | Standard treatment | Intensive treatment |
|---|---:|---:|
| Participants | 91 | 109 |
| Participants with hypertension | 23 | 40 |
| Participants with diabetes | 5 | 10 |
| Median salary | 35,657 | 32,919 |

The proportion receiving intensive treatment was highest in the lowest salary group (≤30,000), at 82.5%.

Hypertension was slightly more common in the >40,000 salary group (33.3%) than in the middle salary group (33.1%). Diabetes was most common in the middle salary group (8.6%).

These comparisons describe the data; they do not establish statistically significant differences or causal relationships. In the coming parts, I will be exploring statistical significance of various outcomes using t-tests and regression models.

### What I Learned

- **Consistency matters:** R is case-sensitive, so variable names and category labels must match exactly.
- **File paths require care:** Forward slashes or raw strings can prevent errors when importing files using Windows paths.
- **Factors improve readability:** Labels make coded categorical variables easier to interpret.
- **Counting depends on the question:** `length()` counts elements, while `sum(condition, na.rm = TRUE)` counts observations meeting a condition.
- **The denominator changes the interpretation:** `prop.table(..., 1)` calculates proportions within each row, while omitting `1` calculates proportions across the whole table.

## Tools

- **R** for data preparation and analysis.
- **readxl** for importing Excel data.
- **Base R** for summaries, boxplots, frequency tables, and proportions.

## Data Availability and Running the Code

The dataset is not included in this public repository. Visitors can review my code and explanations, but reproducing the results requires access to the original Excel dataset.

To run the script:

1. Use R version 4.0 or later, which supports the raw-string syntax used in the import command.
2. Install the `readxl` package if needed.
3. Update the import path to match the dataset’s location on your computer.
4. Run the script from the beginning in RStudio.

## Follow My Progress

I will continue this series with:

- Independent-samples t-tests.
- Linear regression.
- Logistic regression.
- Survival analysis.

For each part, I will share the questions explored, code, results, interpretation, and lessons learned.

This is an evolving learning portfolio, and I will refine it as my skills develop.

## Author

**Rita Ajirenike**  
Medical doctor | MSc Global Health student


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


## Part 3: Linear Regression Analysis

- [Read the regression report](03_regression_analysis.md)
- [View the R code](03_linear_regression_in_R.R)
