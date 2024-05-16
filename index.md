# Stata Programming II Project

**Analysis of Self-Reported Health**

Tenzin Lhaksampa

Originally published: May 8, 2024

Updated: May 16, 2024

## Objective: 
1. Create a Public GitHub Repository:
    - Set up a repository named project on GitHub. You will be working individually, but you are encouraged to use GitHub Discussions to seek help from your peers when needed.

2. Utilize Publicly Available Data:
    - The focus will be on using public data to explore the significance of “self-reported health” as a health indicator.

3. Documentation and Transparency:
    - Document your project comprehensively using a README.md file and other necessary documentation to make your analysis accessible and understandable. Embrace the principles of Open Science which are Rigor, Reproducibility, and Responsibility.

## HW 6 
### 1. Survey Data: 
  - Import the survey data from the 1999-2000 National Health and Nutrition Examination Survey (NHANES):   

    ```import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/DEMO.XPT", clear```

### 2. Mortality Follow-up Data: 
  - Obtain follow-up mortality data to analyze over a 20-year period from the National Center for Health Statistics (NCHS). Detailed linkage instructions are available on the [Linked Mortality](https://ftp.cdc.gov/pub) page:
      - Download the [Mortality Data](https://ftp.cdc.gov/pub/HEALTH_STATISTICS/NCHS/datalinkage/linked_mortality/NHANES_1999_2000_MORT_2019_PUBLIC.dat)
      - Download the [Stata.do file](https://ftp.cdc.gov/pub/HEALTH_STATISTICS/NCHS/datalinkage/linked_mortality/Stata_ReadInProgramAllSurveys.do)

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
  global repo "https://github.com/tlhaksa1/project/raw/main/"
  cls
  do ${repo}followup.do
  save followup, replace 
  import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/DEMO.XPT", clear
  merge 1:1 seqn using followup
  lookfor follow
  ```

### 5. Self-Reported Health Assessment: 
- Prepare for Week 7: Import the specific health questionnaire data 

   ```import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/HUQ.XPT", clear```

## 6. Inferences
Please review [documentation](https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/HUQ.htm) for the file ```HUQ.XPT```, which includes the variable ```huq010```

**Employ 95%CI and p-values**

The following snippet will lay the foundation for your statistical, clinical, and public health inferences:

```
merge 1:1 seqn using demo_mortality, nogen
sts graph, by(huq010) fail
stcox i.huq010
```
**Write a brief abstract-style conclusion**

But learn a little more about the simple questionnaire item of interest to this project:

```
import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/HUQ.XPT", clear 
huq010 
desc huq010
codebook huq010
```
> I have some general questions about your health. Would you say your health in general is:
>
>  - Excellent
>  - Very good
>  - Good
>  - Fair
>  - Poor?
>

## HW 7 
Click [here](dyndoc.html) to view nonparametric and semiparametric risk estimates from Stata
