# Test: Register Based Study

This is a test of the statistical and programming skills required to undertake a register based study.

You must complete this task in R.

## Scenario

You are investigating the hypothesis "Are antibiotics in the first five years of life associated with developing Disease X after five years of life?"

## Data

To investigate this, you have access to three (fake) registries, each corresponding to a file inside the folder "data_raw":

1.  birth_registry.xlsx (contains 10 000 people).
    -   id: ID number.
    -   date_of_birth: Date of birth.
2.  diagnosis_registry.xlsx (contains only the people who have received an ICD-10 diagnosis of "Disease X").
    -   id: ID number.
    -   date_of_icd10_diagnosis: The date at which the person received an ICD-10 diagnosis of "Disease X".
3.  prescription_registry.xlsx (contains only the people who have received an antibiotic prescription).
    -   id: ID number.
    -   date_of_receiving_antibiotics: The date at which the person was prescribed an antibiotic.

## Definitions

- A person has "Disease X" on the date of their third ICD-10 diagnosis.
- A year contains 365.25 days.

## Instructions

1. Write an R script that investigates the hypothesis "Are antibiotics in the first five years of life associated with developing Disease X after five years of life?"

2. Produce a written document (maximum length 2 pages) that contains the following sections:

- Hypothesis
- Methods
- Results
- Conclusions
- Tables (maximum 2, does not count towards page limit)
- Figures (maximum 2, does not count towards page limit)

## Deliverables

Send the:

-   R Script.
-   Written document.

To the requested email address.
