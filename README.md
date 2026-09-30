# Learn R with Me: Rehabilitation Study Analysis

## About This Project

I am a medical doctor and MSc Global Health student developing my skills in R for health data analysis.

In this project, I revisit a rehabilitation study dataset containing 200 participants in standard and intensive treatment groups. Through this “Learn R with Me” series, I share my code, explain my approach, and reflect on what I learn along the way.

The project began as a quantitative methods course exercise involving group discussions. This repository presents my individual R code, subsequent revisions, and my reflections.

## Part 1: Data Preparation and Exploration

Before comparing treatment outcomes, I prepare the data and explore participant characteristics.

In this first part, I practise how to:

- Import an Excel dataset and inspect its structure.
- Calculate changes in cholesterol and triglyceride levels as discharge minus entry values.
- Convert treatment, hypertension, and diabetes variables into labelled factors.
- Group salary into three categories: ≤30,000, >30,000 to ≤40,000, and >40,000.
- Explore changes in cholesterol and triglycerides using boxplots.
- Summarise participant characteristics by treatment group.
- Calculate and interpret proportions within salary groups.

### Selected Descriptive Findings

| Characteristic | Standard treatment | Intensive treatment |
|---|---:|---:|
| Participants | 91 | 109 |
| Participants with hypertension | 23 | 40 |
| Participants with diabetes | 5 | 10 |
| Median salary | 35,657 | 32,919 |

The proportion receiving intensive treatment was highest in the lowest salary group (≤30,000), at 82.5%.

Hypertension was slightly more common in the >40,000 salary group (33.3%) than in the middle salary group (33.1%). Diabetes was most common in the middle salary group (8.6%).

These comparisons describe the data; they do not establish statistically significant differences or causal relationships.

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
