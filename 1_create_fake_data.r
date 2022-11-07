library(data.table)
library(magrittr)

set.seed(4)
full_data <- data.table(id = 1:10000)
full_data[, date_of_birth := as.Date("1920-01-01")+id + round(rnorm(.N, sd=100))]

full_data[, number_antibiotics := rpois(.N, lambda = 10)]
for(i in 1:max(full_data$number_antibiotics)){
  var_antibiotics_date <- paste0("antibiotics_date",i)
  full_data[number_antibiotics>=i, (var_antibiotics_date) := as.Date(round(date_of_birth + 4*365 + 180*i + rnorm(.N, sd=300)))]
  full_data[get(var_antibiotics_date) < date_of_birth, (var_antibiotics_date) := NA]
}

full_data[, number_icd10_diagnoses := rpois(.N, lambda = 2)]
for(i in 1:max(full_data$number_icd10_diagnoses)){
  var_icd10_date <- paste0("icd10_diagnosis_date",i)
  full_data[number_icd10_diagnoses>=i, (var_icd10_date) := as.Date(round(date_of_birth + 4*365 + 180*i + rnorm(.N, sd=300)))]
  full_data[get(var_icd10_date) < date_of_birth, (var_icd10_date) := NA]
}

birth_registry <- full_data %>%
  dplyr::select(id, date_of_birth) %>%
  data.table()
writexl::write_xlsx(birth_registry, "data_raw/birth_registry.xlsx")

prescription_registry <- full_data %>%
  dplyr::select(id, dplyr::starts_with("antibiotics")) %>%
  tidyr::pivot_longer(
    cols = dplyr::starts_with("antibiotics"),
    values_to = "date_of_receiving_antibiotics"
  ) %>%
  dplyr::filter(!is.na(date_of_receiving_antibiotics)) %>%
  dplyr::select(-name) %>%
  data.table()
writexl::write_xlsx(prescription_registry, "data_raw/prescription_registry.xlsx")

diagnosis_registry <- full_data %>%
  dplyr::select(id, dplyr::starts_with("icd10")) %>%
  tidyr::pivot_longer(
    cols = dplyr::starts_with("icd10"),
    values_to = "date_of_icd10_diagnosis"
  ) %>%
  dplyr::filter(!is.na(date_of_icd10_diagnosis)) %>%
  dplyr::select(-name) %>%
  data.table()
writexl::write_xlsx(diagnosis_registry, "data_raw/diagnosis_registry.xlsx")
