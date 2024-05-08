# Stata Programming II Project
Tenzin Lhaksampa

## HW 6 
### 1. Survey Data: 
  - Import the survey data from the 1999-2000 National Health and Nutrition Examination Survey (NHANES):   

    ```import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/DEMO.XPT", clear```

### 2. Mortality Follow-up Data: 
  - Obtain follow-up mortality data to analyze over a 20-year period from the National Center for Health Statistics (NCHS). Detailed linkage instructions are available on the [Linked Mortality](https://ftp.cdc.gov/pub) page:
  - Click as follows
    - Health Statistics
      - NCHS
        - Datalinkage
          - Linked Mortality
            - ```NHANES_1999_2000_MORT_2019_PUBLIC.dat```
            - ```Stata_ReadInProgramAllSurveys.do```

### 3. Edit and Rename Provided Script:
- Use the ```Stata_ReadInProgramAllSurveys.do``` file from NCHS
- Modify the absolute file path
- Modify ```SURVEY``` to ```NHANES_1999_2000```
- Save it as ```followup.do```
- Upload it to your GitHub Project repo

## 4. Data Merging: 
- Execute the following Stata code to merge the survey data with the mortality data, ensuring alignment on the unique sequence numbers:

  ```
  //use your own username/project repo instead of the class repo below
  global repo "https://github.com/jhustata/intermediate/raw/main/"
  do ${repo}followup.do
  save followup, replace 
  import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/DEMO.XPT", clear
  merge 1:1 seqn using followup
  lookfor follow
  ```

### 5. Self-Reported Health Assessment: 
- Prepare for Week 7: Import the specific health questionnaire data 

   ```import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/HUQ.XPT", clear```

## HW 7 
