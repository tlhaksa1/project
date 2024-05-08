# Stata Programming II Project
## Tenzin Lhaksampa

## 1. Survey Data from NHANES
  - import the survey data from the 1999-2000 NANES
  - use the stata command as follows
    
    ```import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/DEMO.XPT", clear```

## 2. Mortality Follow-up Data from NCHS
  - click this [Link]([https://ftp.cdc.gov/pub]([https://ftp.cdc.gov/pub))
  - click as follows
    - Health Statistics
      - NCHS
        - Datalinkage
          - Linked Mortality - ```Stata_ReadInProgramALlSurveys.do```

## 3. Create followup.do filw
- use the do file from NCHS
- edit the absolute file path
- edit ```SURVEY``` and change it into ```NHANES_1999_2000```
- save it as ```followup.do```

## 4. Merge Data between NHANES and NCHS
- use the following stata commands

```
//use your own username/project repo instead of the class repo below
global repo "https://github.com/jhustata/intermediate/raw/main/"
do ${repo}followup.do
save followup, replace 
import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/DEMO.XPT", clear
merge 1:1 seqn using followup
lookfor follow
```

## 5. Prepare for Week 7
import the specific health questionnaire data
