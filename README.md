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


!<img width="680" height="148" alt="d1" src="https://github.com/user-attachments/assets/f8d7752e-df5a-406f-81cd-2d4cb2c10dce" />



How to interpret: Because change is calculated as value at discharge minus value at entry, a negative value indicates a reduction, a positive value indicates an increase, and zero reflects no change.

These variables will be used for subsequent analyses to compare changes between the treatment groups (standard vs treatment).

## Step 3: Creating labelled categorical variables
The original treatment, hypertension, and diabetes variables use numerical codes (0 & 1). I create labelled factors and labeled them accordingly. This makes the variables easier to interpret.

<img width="601" height="202" alt="d2" src="https://github.com/user-attachments/assets/17ce5867-3c22-48b1-a0ba-88d03ba8311c" />


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
1. How many participants are in each treatment group?
2. How many participants in the intensive treatment group have hypertension, and how many have diabetes?
3. What is the median salary among participants in the standard treatment group?
   
Note-- The hypertension and diabetes counts are calculated separately; participants may have both conditions.

<img width="528" height="127" alt="part  by treat group" src="https://github.com/user-attachments/assets/57a0b55b-c49f-4daa-b54d-ff572f86e608" />


<img width="1158" height="355" alt="des stats" src="https://github.com/user-attachments/assets/5e70b688-e3a6-416c-9caa-beb99a253405" />


<img width="695" height="222" alt="med salary" src="https://github.com/user-attachments/assets/215ca57e-fae7-4ebc-84a0-a80d7316769c" />


## Step 7: Comparing proportions within salary groups
Guiding questions:
1. Which salary group has the highest proportion of participants receiving intensive treatment?
2. Which salary group has the highest proportion of participants with hypertension?
3. Which salary group has the highest proportion of participants with diabetes?


<img width="922" height="397" alt="p2" src="https://github.com/user-attachments/assets/7be37fd7-0a35-48f7-9d15-4dbda95e9988" />


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

**Rita N. Ajirenike**  
Medical doctor | MSc Global Health scholar


## Part 2: Comparing Treatment Outcomes Using t-Tests

- [Read the t-test report](02_t_test_analysis.md)
- [View the R code](02_comparing_treatment_outcomes_using_t_tests_in_R.R)

## Part 3: Linear Regression Analysis

- [Read the regression report](03_regression_analysis.md)
- [View the R code](03_linear_regression_in_R.R)
